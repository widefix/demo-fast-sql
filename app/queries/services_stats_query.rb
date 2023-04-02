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
end
