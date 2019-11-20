# frozen_string_literal: true

module Vk
  class ApiCallError < StandardError
    attr_reader :error_code, :error_msg, :request_params

    def initialize(error_code:, error_msg:, request_params:)
      @error_code = error_code
      @error_msg = error_msg
      @request_params = request_params

      super(formatted_message)
    end

    private

    METHOD_KEY = 'method'

    private_constant :METHOD_KEY

    def formatted_message
      "VK API error while executing '#{api_method}': #{error_msg} [#{error_code}]"
    end

    def api_method
      @api_method ||= request_params.find { |param| param[:key] == METHOD_KEY }.fetch(:value)
    end
  end
end
