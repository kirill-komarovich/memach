# frozen_string_literal: true

require 'types/message_entities/bot_command'

module Handlers
  class ApplicationHandler
    include Import['telegram.bot']

    def initialize(**params)
      @current_message = params.delete(:message)

      super(params)
    end

    def call(message)
      handler_for(message).new(message: message).call
    end

    private

    attr_reader :current_message

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
