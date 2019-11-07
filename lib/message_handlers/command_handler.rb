# frozen_string_literal: true

require 'message_handlers/abstract_handler'

module MessageHandlers
  class CommandHandler < AbstractHandler
    class << self
      attr_reader :command

      def command_handlers
        @command_handlers ||= []
      end

      def inherited(subclass)
        command_handlers << subclass
      end

      def for_command(command)
        @command = command
      end

      def can_handle?(message)
        message.start_with?(command)
      end

      def handler_class(message)
        command_handlers.detect { |handler| handler.can_handle?(message) }
      end
    end
  end
end
