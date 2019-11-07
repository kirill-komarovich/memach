# frozen_string_literal: true

require 'import'
require 'transactions/create_user'
require 'message_handlers/command_handler'

module MessageHandlers
  module CommandHandlers
    class StartHandler < CommandHandler
      include Import['rom']

      for_command '/start'

      def initialize(params)
        super(params)

        @user_params = message.from.to_h.merge(chat_id: chat_id).compact
        @user_params[:telegram_id] = @user_params.delete(:id)
      end

      def call
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

      def add_user(attributes, &block)
        CreateUser.new.call(attributes, &block)
      end
    end
  end
end
