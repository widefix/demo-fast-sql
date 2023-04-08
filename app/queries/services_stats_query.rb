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

  SQL2 = <<~SQL
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

  SQL3 = <<~SQL
    SELECT s.category_id AS categoryId,
      c1.name AS categoryName,
      c2.name AS subcategoryName,
      COUNT(DISTINCT p1.id) AS completedProjectsCount,
      COUNT(DISTINCT r1.id) AS ratingsCount,
      ROUND(AVG(r1.rating), 1) AS ratingsAverage
    FROM services s
    JOIN users u ON s.user_id = u.id
    JOIN categories c1 ON c1.id = s.category_id
    JOIN categories c2 ON c2.id = c1.parent_id
    LEFT JOIN projects p1 ON p1.vendor_id = u.id AND p1.status = 'Complete' AND p1.category_id = s.category_id
    LEFT JOIN ratings r1 ON r1.reviewee_id = u.id AND r1.project_id = p1.id
    WHERE s.status = 'approved' AND s.active = true AND u.id = :userId
    GROUP BY s.category_id, c1.name, c2.name
    ORDER BY completedProjectsCount DESC;
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

  def call_ruby_gpt
    projects_full = []
    projects_empty = []

    # Use includes to avoid N+1 query problem
    services = Service.includes(category: [:parent])
                      .where(user: user, status: "approved", active: true)
                      .order(category_id: :asc)

    # Preload ratings and group them by project_id
    ratings = Rating.includes(:project)
                    .where(reviewee: user)
                    .group_by(&:project_id)

    services.each do |service|
      ratings_count = 0
      ratings_total = 0

      # Use preloaded ratings instead of querying them for each service
      service_ratings = ratings.select do |project_id, project_ratings|
        project_ratings.first.project.category_id == service.category_id
      end

      service_ratings.each do |_project_id, project_ratings|
        project_ratings.each do |rating|
          ratings_count += 1
          ratings_total += rating.rating
        end
      end

      ratings_average = (ratings_total / ratings_count.to_f).round(1).to_s if ratings_count != 0 && ratings_total != 0

      completed_projects_count = Project.where(vendor: user, status: "Complete", category_id: service.category_id).size

      service_hash = {
        categoryId: service.category_id,
        categoryName: service.category.parent.name,
        subcategoryName: service.category.name,
        completedProjectsCount: completed_projects_count,
        ratingsCount: ratings_count,
        ratingsAverage: ratings_average,
      }

      if completed_projects_count > 0
        projects_full.push(service_hash)
      else
        projects_empty.push(service_hash)
      end
    end

    projects_full.sort_by! { |k| -k[:completedProjectsCount] }
    projects_full.push(*projects_empty)

    projects_full
  end

  def call_sql_gpt
    sql_query = <<-SQL
      SELECT
        c1.id AS category_id,
        c2.name AS category_name,
        c1.name AS subcategory_name,
        COUNT(DISTINCT p.id) FILTER (WHERE p.status = 'Complete') AS completed_projects_count,
        COUNT(r.id) AS ratings_count,
        COALESCE(AVG(r.rating), 0) AS ratings_average
      FROM
        services s
        JOIN categories c1 ON s.category_id = c1.id
        JOIN categories c2 ON c1.parent_id = c2.id
        LEFT JOIN projects p ON s.user_id = p.vendor_id AND p.category_id = c1.id
        LEFT JOIN ratings r ON s.user_id = r.reviewee_id AND p.id = r.project_id
      WHERE
        s.user_id = :user_id AND s.status = 'approved' AND s.active = true
      GROUP BY
        c1.id, c2.name, c1.name
      ORDER BY
        completed_projects_count DESC, c1.id ASC;
    SQL

    sql = ActiveRecord::Base.sanitize_sql_array([sql_query, user_id: user.id])
    result = ActiveRecord::Base.connection.execute(sql).to_a


    projects_full = []
    projects_empty = []

    result.each do |row|
      service_hash = row.symbolize_keys

      if service_hash[:completed_projects_count] > 0
        projects_full.push(service_hash)
      else
        projects_empty.push(service_hash)
      end
    end

    projects_full.concat(projects_empty)
  end

  def call_sql
    sql = ActiveRecord::Base.sanitize_sql_array([SQL, user_id: user.id])
    ActiveRecord::Base.connection.execute(sql).to_a
  end

  def call_sql2
    sql = ActiveRecord::Base.sanitize_sql_array([SQL2, user_id: user.id])
    ActiveRecord::Base.connection.execute(sql).to_a
  end

  def call_sql3
    sql = ActiveRecord::Base.sanitize_sql_array([SQL3, userId: user.id])
    ActiveRecord::Base.connection.execute(sql).to_a
  end
end
