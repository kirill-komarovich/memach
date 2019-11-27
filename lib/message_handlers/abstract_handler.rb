# frozen_string_literal: true

require 'import'

module MessageHandlers
  class AbstractHandler
    include Import['telegram.bot']

    def initialize(params)
      @message = params.delete(:message)
      @chat_id = @message.chat.id

      super(params)
    end

    def call
      raise NotImplementedError
    end

    private

    attr_reader :message, :chat_id

    def send_message(params)
      bot.api.send_message(params.merge(chat_id: chat_id))
    end
  end
end
