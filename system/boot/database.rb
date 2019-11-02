# frozen_string_literal: true

Bot.boot(:database) do
  init do
    require 'rom'
    require 'rom-sql'
    require 'rom-repository'
    require 'pg'
  end

  start do |container|
    rom_config = Bot.database_config.fetch(Bot.env.to_s)
    rom = ROM.container(:sql, rom_config) do |config|
      config.auto_registration(Bot.root.join('lib'), namespace: false)
      config.gateways[:default].use_logger(container.logger) if Bot.env == :development
    end
    container.register('rom', rom)
  end
end
