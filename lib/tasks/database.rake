# frozen_string_literal: true

require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    database_config = Bot.database_config.fetch(Bot.env.to_s)
    ROM::SQL::RakeSupport.env = ROM.container(:sql, database_config) do |config|
      config.gateways[:default].use_logger(Bot.logger) if Bot.env == :development
    end
  end

  task :create do
    config = Bot.database_config.fetch('default').merge('database' => :postgres)
    rom = ROM.container(:sql, config)
    %w[development test].each do |env|
      database = Bot.database_config.fetch(env)['database']
      rom.gateways[:default].run("CREATE DATABASE #{database};")
      Bot.logger.info("Database #{database} has been created")
    end
  end

  task :drop do
    config = Bot.database_config.fetch('default').merge('database' => :postgres)
    rom = ROM.container(:sql, config)
    %w[development test].each do |env|
      database = Bot.database_config.fetch(env)['database']
      rom.gateways[:default].run("DROP DATABASE #{database};")
      Bot.logger.info("Database #{database} has been deleted")
    end
  end
end
