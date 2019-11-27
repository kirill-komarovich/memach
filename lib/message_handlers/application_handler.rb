# frozen_string_literal: true

require 'types/message_entities/bot_command'

module MessageHandlers
  class ApplicationHandler
    def call(message)
      handler_for(message).new(message: message).call
    end

    def handler_for(message)
      case message
      when Types::MessageEntities::BotCommand
        CommandHandler.handler_class(message.text)
      else
        UnknownHandler
      end
    end
  end
end
