# frozen_string_literal: true

require 'dry/system/container'
require 'dry/system/components'
require 'yaml'

class Application < Dry::System::Container
  setting :token
  setting :database, reader: true
  use :env, inferrer: -> { ENV.fetch('BOT_ENV', :development).to_sym }
  use :logging

  configure do |config|
    config.auto_register = 'lib'
    config.token = ENV.fetch('BOT_TOKEN')
    config.logger = Logger.new('/proc/1/fd/1')
    if config.env == :production
      config.database = { url: ENV.fetch('DB_URL') }
    else
      database_config = YAML.load_file(File.join(__dir__, '../config', 'database.yml'))
      config.database = database_config.fetch(config.env.to_s)
    end
  end

  load_paths!('lib', 'system')
end
