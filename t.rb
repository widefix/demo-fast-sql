require 'benchmark/ips'

user = User.find(10)
service = ServicesStatsQuery.new(user)

Benchmark.ips do |x|
  x.report("ruby") { service.call_ruby }
  x.report("ruby_gpt") { service.call_ruby_gpt }
  x.report("sql_gpt") { service.call_sql_gpt }
  x.report("sql") { service.call_sql }
  x.report("sql2") { service.call_sql2 }
  x.report("sql3") { service.call_sql3 }
  x.compare!
end
