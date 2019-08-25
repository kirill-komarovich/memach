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
  task default: %i[bundle:audit rubocop spec]
end

namespace :g do
  desc 'Generate migration'
  task :migration do
    name = ARGV[1] || raise('Specify name: rake g:migration your_migration')
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split('_').map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<~MIGRATION
        class #{migration_class} < ActiveRecord::Migration[6.0]
          def change
          end
        end
      MIGRATION
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end
