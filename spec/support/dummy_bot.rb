# frozen_string_literal: true

class DummyBotApi
  def send_message(*args); end
end

class DummyBot
  attr_reader :api

  def initialize
    @api = DummyBotApi.new
  end
end
