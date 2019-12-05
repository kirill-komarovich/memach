# frozen_string_literal: true

Bot.boot(:database) do
  init do |container|
    require 'rom'
    require 'rom-sql'

    rom_config = container.config.database_config.fetch(Bot.env.to_s)
    rom = ROM.container(:sql, rom_config) do |config|
      config.auto_registration(Bot.root.join('lib'), namespace: false)
      config.gateways[:default].use_logger(logger) if Bot.env == :development
    end
    register('rom', rom)
  end
end
