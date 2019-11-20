# frozen_string_literal: true

require 'json'
require 'services/vk/connection'

module Vk
  class Api
    def groups(method, params)
      call(:groups, method, params)
    end

    private

    def call(resource, method, params)
      response = send_request(resource, method, params)

      JSON.parse(response.body, symbolize_names: true).fetch(:response)
    end

    def connection
      @connection ||= Connection.new
    end

    def send_request(resource, method, params)
      api_version = ENV.fetch('VK_API_VERSION')
      access_token = ENV.fetch('VK_API_SERVICE_TOKEN')

      connection.get do |request|
        request.url("/method/#{resource}.#{method}", v: api_version, access_token: access_token)
        request.params.merge!(params)
      end
    end
  end
end
