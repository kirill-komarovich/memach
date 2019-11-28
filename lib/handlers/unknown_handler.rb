# frozen_string_literal: true

module Handlers
  class UnknownHandler < ApplicationHandler
    def call
      bot.api.send_message(text: 'Unknown command or message', chat_id: current_message.chat.id)
    end
  end
end
