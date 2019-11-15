# frozen_string_literal: true

module Types
  module MessageEntities
    class BotCommand < Telegram::Bot::Types::Message
      BOT_COMMAND = 'bot_command'

      def self.===(message)
        message.entities.any? { |entity| entity.type == BOT_COMMAND }
      end
    end
  end
end
