require 'bundler' rescue 'You must `gem install bundler` and `bundle install` to run rake tasks'
require "bundler/gem_tasks"

require "rspec"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec') do |spec|
  spec.pattern = "spec/**/*_spec.rb"

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  # spec.rspec_opts = '--order rand:16996'
end

task :default => :spec

namespace :ez_enum do
  # TODO
end