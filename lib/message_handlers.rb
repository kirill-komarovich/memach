# frozen_string_literal: true

module MessageHandlers
  MESSAGE_ENTITY_TYPES = [
    BOT_COMMAND = 'bot_command'
  ].freeze

  def self.handle(message)
    StartHandler.new(message: message).handle
  end
end
