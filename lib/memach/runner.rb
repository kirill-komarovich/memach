# frozen_string_literal: true

require 'import'

module Memach
  class Runner
    include Import['telegram.bot']

    def run
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
        end
      end
    end
  end
end
