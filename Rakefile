# frozen_string_literal: true

require 'bundler/setup'
require 'dotenv/load'
require_relative 'system/container'

Application.finalize!

if %i[development test].include? Application.env
  require 'rubocop/rake_task'
  require 'bundler/audit/task'
  Bundler::Audit::Task.new
  RuboCop::RakeTask.new

  task(:default).clear
  task default: %i[bundle:audit rubocop eslint spec]
end

namespace :db do
  desc 'Create the database'
  task :create do
    ActiveRecord::Base.establish_connection(Application.database.merge(
                                              'database' => 'postgres',
                                              'schema_search_path' => 'public'
                                            ))
    ActiveRecord::Base.connection.create_database(Application.database['database'])
    puts "Database #{Application.database['database']} created"
  end

  desc 'Migrate the database'
  task :migrate do
    ActiveRecord::Base.establish_connection(Application.database)
    ActiveRecord::MigrationContext.new('db/migrate/').migrate
    Rake::Task['db:schema'].invoke
    puts 'Database migrated.'
  end

  desc 'Migrate the database'
  task :rollback do
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::MigrationContext.new('db/migrate/').rollback
    Rake::Task['db:schema'].invoke
    puts 'Last migration has been reverted.'
  end

  desc 'Drop the database'
  task :drop do
    ActiveRecord::Base.establish_connection(Application.database.merge(
                                              'database' => 'postgres',
                                              'schema_search_path' => 'public'
                                            ))
    ActiveRecord::Base.connection.drop_database(Application.database['database'])
    puts "Database #{Application.database['database']} deleted"
  end

  desc 'Reset the database'
  task reset: %i[drop create migrate]

  desc 'Create a db/schema.rb file that is portable against any DB supported by AR'
  task :schema do
    ActiveRecord::Base.establish_connection(Application.database)
    require 'active_record/schema_dumper'

    filename = 'db/schema.rb'
    File.open(filename, 'w:utf-8') do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end
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
        class #{migration_class} < ActiveRecord::Migration[5.2]
          def self.change
          end
        end
      MIGRATION
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end
