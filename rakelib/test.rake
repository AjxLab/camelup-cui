# frozen_string_literal: true

desc 'Run tests'
task :test do
  sh 'bundle exec rspec spec/*.rb'
end
