# frozen_string_literal: true

module Vk
  class Connection
    extend Forwardable

    def_delegators :client, :get

    def initialize
      client do |config|
        config.request :url_encoded

        config.response :logger do |logger|
          logger.filter(/(access_token=)(\w+)/, '\1[FILTERED]')
        end

        config.adapter request_adapter
      end
    end

    private

    def client(&block)
      @client ||= Faraday.new(url: ENV.fetch('VK_API_URL'), &block)
    end

    def request_adapter
      Faraday.default_adapter
    end
  end
end
