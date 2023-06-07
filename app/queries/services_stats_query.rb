class ServicesStatsQuery
  SQL = <<~SQL
    select
      s.category_id as "categoryId",
      pc.name as "categoryName",
      c.name as "subcategoryName",
      count(p.id) as "completedProjectsCount",
      r.count as "ratingsCount",
      r.avg as "ratingsAverage"
      from services s
      join categories c on c.id = s.category_id
      join categories pc on pc.id = c.parent_id
      left join lateral (
        select count(r.id), cast(round(coalesce(avg(r.rating), 0), 1) as text) as avg from ratings r
        join projects rp on rp.id = r.project_id and s.category_id = rp.category_id
        where r.reviewee_id = :user_id
      ) r on true
      left join projects p on p.vendor_id = :user_id and p.status = 'Complete' and p.category_id = s.category_id
      where s.status = 'approved' and s.active and s.user_id = :user_id
      group by s.category_id, pc.name, c.name, r.count, r.avg
      order by count(p.id) desc, s.category_id asc
  SQL

  SQL_GPT = <<~SQL
    SELECT
      s.category_id AS "categoryId",
      pc.name AS "categoryName",
      c.name AS "subcategoryName",
      COUNT(p.id) AS "completedProjectsCount",
      COUNT(r.id) AS "ratingsCount",
      COALESCE(CAST(ROUND(AVG(r.rating), 1) AS TEXT), '0') AS "ratingsAverage"
    FROM
      services s
      JOIN categories c ON c.id = s.category_id
      JOIN categories pc ON pc.id = c.parent_id
      LEFT JOIN projects p ON p.vendor_id = :user_id AND p.status = 'Complete' AND p.category_id = s.category_id
      LEFT JOIN ratings r ON r.reviewee_id = :user_id AND r.project_id = p.id
    WHERE
      s.status = 'approved' AND s.active AND s.user_id = :user_id
    GROUP BY
      s.category_id, pc.name, c.name
    ORDER BY
      COUNT(p.id) DESC, s.category_id ASC;
  SQL

  SQL_GPT_NEW = <<~SQL
    -- Get average ratings and count for each service
    WITH rating_summary AS (
      SELECT p.category_id, COUNT(r.id) AS ratings_count, COALESCE(AVG(r.rating), 0) AS ratings_average
      FROM ratings r
      INNER JOIN projects p ON p.id = r.project_id
      WHERE r.reviewee_id = :user_id
      GROUP BY p.category_id
    ),

    -- Get completed projects count for each service
    completed_projects AS (
      SELECT category_id, COUNT(*) AS completed_projects_count
      FROM projects
      WHERE vendor_id = :user_id AND status = 'Complete'
      GROUP BY category_id
    )

    -- Combine the results
    SELECT
      s.category_id,
      c.name AS category_name,
      p.name AS subcategory_name,
      COALESCE(cp.completed_projects_count, 0) AS completed_projects_count,
      COALESCE(rs.ratings_count, 0) AS ratings_count,
      ROUND(COALESCE(rs.ratings_average, 0), 1) AS ratings_average
    FROM services s
    JOIN categories c ON c.id = s.category_id
    JOIN categories p ON p.id = c.parent_id
    LEFT JOIN rating_summary rs ON rs.category_id = s.category_id
    LEFT JOIN completed_projects cp ON cp.category_id = s.category_id
    WHERE s.user_id = :user_id AND s.status = 'approved' AND s.active = true
    ORDER BY completed_projects_count DESC;
  SQL

  attr_accessor :user

  def initialize(user)
    self.user = user
  end

  def call_ruby
    projects_full = []
    projects_empty = []
    Service.where(user: user, status: "approved", active: true).order(category_id: :asc).each do |service|
      ratings_average = 0
      ratings_count = 0
      ratings_total = 0
      Rating.where(reviewee: user).each do |rating|
        project = Project.find(rating.project_id)
        if project.category_id == service.category_id
          ratings_count += 1
          ratings_total += rating.rating
        end
      end
      ratings_average = (ratings_total / ratings_count.to_f).round(1).to_s if ratings_count != 0 && ratings_total != 0
      completed_projects_count = Project.where(vendor: user, status: "Complete", category_id: service.category_id).size
      service_hash = {
        category_id: service.category_id,
        category_name: Category.find(Category.find(service.category_id).parent_id).name,
        subcategory_name: Category.find(service.category_id).name,
        completed_projects_count: completed_projects_count,
        ratings_count: ratings_count,
        ratings_average: ratings_average,
      }
      resolved_hash = service_hash.transform_keys{ |k| k.to_s.camelize(:lower) }
      if completed_projects_count > 0
        projects_full.push(resolved_hash)
      else
        projects_empty.push(resolved_hash)
      end
    end
    projects_full.sort_by!{ |k| -k["completedProjectsCount"] }
    projects_full.push(*projects_empty)

    projects_full
  end

  def call_sql
    sql = ActiveRecord::Base.sanitize_sql_array([SQL, user_id: user.id])
    ActiveRecord::Base.connection.execute(sql).to_a
  end

  def call_sql_gpt
    sql = ActiveRecord::Base.sanitize_sql_array([SQL_GPT, user_id: user.id])
    ActiveRecord::Base.connection.execute(sql).to_a
  end

  def call_sql_gpt_new
    sql = ActiveRecord::Base.sanitize_sql_array([SQL_GPT_NEW, user_id: user.id])
    ActiveRecord::Base.connection.execute(sql).to_a
  end
end
