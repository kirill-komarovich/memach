# frozen_string_literal: true

require 'dry/system/container'
require 'dry/system/components'
require 'yaml'
require 'erb'

class Bot < Dry::System::Container
  setting :token
  setting :database_config, reader: true
  use :env, inferrer: -> { ENV.fetch('BOT_ENV', :development).to_sym }
  use :logging

  configure do |config|
    config.auto_register = %w[lib]
    config.default_namespace = %w[memach]
    config.token = ENV.fetch('BOT_TOKEN')
    config.logger = Logger.new(STDOUT)
    database_config_path = Bot.root.join('config/database.yml')
    database_config_file = ERB.new(File.read(database_config_path)).result
    config.database_config = YAML.safe_load(database_config_file, [], [], true)
  end

  load_paths!('lib', 'system')
end
