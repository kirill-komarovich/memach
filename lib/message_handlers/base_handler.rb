# frozen_string_literal: true

require 'import'

module MessageHandlers
  class BaseHandler
    include Import['logger', 'telegram.bot']

    def initialize(params)
      @message = params.delete(:message)
      @chat_id = @message.chat.id
      super(params)
    end

    def handle
      raise NotImplementedError
    end

    private

    attr_reader :message, :chat_id

    def send_message(params)
      bot.api.send_message(params.merge(chat_id: chat_id))
    end

    def bot_command?
      message.entities.any? { |entity| entity.type == BOT_COMMAND }
    end
  end
end
