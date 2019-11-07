# frozen_string_literal: true

require 'message_handlers/abstract_handler'

module MessageHandlers
  class UnknownHandler < AbstractHandler
    def call
      send_message(text: 'Unknown command or message')
    end
  end
end
