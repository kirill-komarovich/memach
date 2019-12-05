# frozen_string_literal: true

Bot.boot(:vk) do
  init do
    require 'faraday'
    require 'services/vk/api'

    register('vk', Vk::Api.new)
  end
end
