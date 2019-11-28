# frozen_string_literal: true

require 'import'

module Handlers
  module CommandHandlers
    class StartHandler < ApplicationHandler
      include Import[
        :rom,
        'transactions.create_record',
        'repositories.user_repository',
        'contracts.new_user_contract'
      ]
      include CommandHandler['/start']

      def call
        add_user(user_params) do |result|
          result.success(&method(:successful_response))
          result.failure(&method(:error_response))
        end
      end

      private

      def user_params
        @user_params ||= current_message.from.to_h.compact.tap do |user_params|
          user_params[:chat_id] = current_message.chat.id
          user_params[:telegram_id] = user_params.delete(:id)
        end
      end

      def add_user(attributes, &block)
        create_record.with_step_args(
          validate: [contract: new_user_contract],
          create: [repository: user_repository]
        ).call(attributes, &block)
      end

      def successful_response(user)
        bot.api.send_message(text: "Hello, #{user.first_name}", chat_id: current_message.chat.id)
      end

      def error_response(errors)
        error_messages = errors.to_h.map.with_index do |(attribute, messages), index|
          "#{index + 1}. #{attribute} #{messages.join(', ')}"
        end.join("\n")
        bot.api.send_message(text: "ERRORS:\n#{error_messages}", chat_id: current_message.chat.id)
      end
    end
  end
end
