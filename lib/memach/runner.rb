# frozen_string_literal: true

require 'import'
require 'message_handlers'

module Memach
  class Runner
    include Import['telegram.bot']

    def run
      bot.listen do |message|
        MessageHandlers.handle(message)
      end
    end
  end
end
