# frozen_string_literal: true

Bot.boot(:vk) do
  init do
    require 'services/vk/api'
  end

  start do |container|
    vk_api = Vk::Api.new
    container.register('vk', vk_api)
  end
end
