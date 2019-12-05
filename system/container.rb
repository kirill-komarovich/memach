# frozen_string_literal: true

require 'dotenv'
require 'dry/system/container'
require 'dry/system/components'
require 'erb'
require 'yaml'

class Bot < Dry::System::Container
  setting :database_config, reader: true
  use :env, inferrer: -> { ENV.fetch('BOT_ENV', :development).to_sym }
  use :logging

  configure do |config|
    Dotenv.load('.env', ".env.#{Bot.env}")

    config.auto_register = %w[lib]
    config.default_namespace = %w[memach]
    config.logger = Logger.new(STDOUT)
    database_config_path = Bot.root.join('config/database.yml')
    database_config_file = ERB.new(File.read(database_config_path)).result
    config.database_config = YAML.safe_load(database_config_file, [], [], true)
  end

  load_paths!('lib', 'system')
end
