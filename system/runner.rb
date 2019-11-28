# frozen_string_literal: true

require 'import'

class Runner
  include Import['telegram.bot', 'handlers.application_handler']

  def call
    bot.listen do |message|
      application_handler.call(message)
    end
  end
end
