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

      def alias_commands(*command_aliases)
        @command_aliases = command_aliases
      end

      def command_aliases
        @command_aliases ||= []
      end

      def can_handle?(message)
        message.start_with?(command, *command_aliases)
      end

      def handler_class(message)
        command_handlers.detect { |handler| handler.can_handle?(message) }
      end
    end

    def command
      self.class.command
    end

    def command_aliases
      self.class.command_aliases
    end

    def command_arguments
      @command_arguments ||= message.text.gsub(/^(#{command_filter})(\s+|$)/, '').split
    end

    def command_filter
      (command_aliases << command).join('|')
    end
  end
end
