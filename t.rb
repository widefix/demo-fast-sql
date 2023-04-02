require 'benchmark/ips'

user = User.find(10)
service = ServicesStatsQuery.new(user)

Benchmark.ips do |x|
  x.report("ruby") { service.call_ruby }
  x.report("sql") { service.call_sql }
  x.compare!
end
