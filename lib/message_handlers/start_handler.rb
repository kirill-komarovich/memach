# frozen_string_literal: true

require 'message_handlers/base_handler'

module MessageHandlers
  class StartHandler < BaseHandler
    START_COMMAND_TEXT = '/start'

    def initialize(params)
      super(params)

      user_params = message.from.to_h
      user_params[:telegram_id] = user_params.delete(:id)
      @user = User.new(user_params.merge(chat_id: chat_id))
    end

    def handle
      return unless start_command?

      send_message(text: "Hello, #{user.first_name}") if user.save
    end

    private

    attr_reader :user

    def start_command?
      message.text == START_COMMAND_TEXT && bot_command?
    end
  end
end
