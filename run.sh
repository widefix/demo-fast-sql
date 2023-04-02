bundle install
rails db:create
rails db < demo-dump.sql
rails runner t.rb
