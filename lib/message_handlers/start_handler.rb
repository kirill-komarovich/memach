# frozen_string_literal: true

require 'import'
require 'message_handlers/base_handler'
require 'transactions/create_user'

module MessageHandlers
  class StartHandler < BaseHandler
    include Import['rom']

    START_COMMAND_TEXT = '/start'

    def initialize(params)
      super(params)

      @user_params = message.from.to_h.merge(chat_id: chat_id).compact
      @user_params[:telegram_id] = @user_params.delete(:id)
    end

    def handle
      return unless start_command?

      add_user(user_params) do |result|
        result.success do |user|
          send_message(text: "Hello, #{user.first_name}")
        end
        result.failure do |errors|
          error_messages = errors.to_h.map.with_index do |(attribute, messages), index|
            "#{index + 1}. #{attribute} #{messages.join(', ')}"
          end.join("\n")
          send_message(text: "ERRORS:\n#{error_messages}")
        end
      end
    end

    private

    attr_reader :user_params

    def start_command?
      message.text == START_COMMAND_TEXT && bot_command?
    end

    def add_user(attributes, &block)
      CreateUser.new.call(attributes, &block)
    end
  end
end
