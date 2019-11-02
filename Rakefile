# frozen_string_literal: true

require 'bundler/setup'
require_relative 'system/container'

STDOUT.sync = true
Bundler.require(:default, Bot.env)
Dotenv.load('.env', ".env.#{Bot.env}")

Dir.glob('lib/tasks/*.rake').each { |r| load r }

if %i[development test].include? Bot.env
  require 'rubocop/rake_task'
  require 'bundler/audit/task'
  require 'rspec/core/rake_task'

  Bundler::Audit::Task.new
  RuboCop::RakeTask.new
  RSpec::Core::RakeTask.new(:spec)

  task(:default).clear
  task(default: %i[bundle:audit rubocop spec])
end
