# frozen_string_literal: true

require 'import'

module MessageHandlers
  module CommandHandlers
    class StartHandler < CommandHandler
      include Import[
        :rom,
        'transactions.create_record',
        'repositories.user_repository',
        'contracts.new_user_contract'
      ]

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
        create_record.with_step_args(
          validate: [contract: new_user_contract],
          create: [repository: user_repository]
        ).call(attributes, &block)
      end
    end
  end
end
