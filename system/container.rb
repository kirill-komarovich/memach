# frozen_string_literal: true

require 'dry/system/container'
require 'dry/system/components'

class Application < Dry::System::Container
  setting :token
  use :env, inferrer: -> { ENV.fetch('BOT_ENV', :development).to_sym }
  use :logging

  configure do |config|
    config.auto_register = 'lib'
    config.token = ENV.fetch('BOT_TOKEN')
    config.logger = Logger.new('/proc/1/fd/1')
  end

  load_paths!('lib', 'system')
end
