require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new(:test) do |task|
  task.libs << "test"
  task.test_files = Dir['test/**/*_spec.rb']
end

task default: :test
