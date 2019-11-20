# frozen_string_literal: true

module Vk
  class Api
    def groups(method, params)
      call(:groups, method, params)
    end

    def call(resource, method, params)
      response = send_request(resource, method, params)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      raise ApiCallError, parsed_response[:error] unless parsed_response[:error].nil?

      parsed_response.fetch(:response)
    end

    private

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
