# frozen_string_literal: true

module Handlers
  class CommandHandler < Module
    ClassMethods = Class.new(Module)
    InstanceMethods = Class.new(Module)

    class << self
      def command_handlers
        @command_handlers ||= []
      end

      def handler_class(message)
        command_handlers.detect { |handler| handler.can_handle?(message) }
      end

      def [](*commands)
        new(commands)
      end
    end

    attr_reader :commands, :class_mod, :instance_mod

    def initialize(commands)
      @commands = commands
      @class_mod = ClassMethods.new
      @instance_mod = InstanceMethods.new
    end

    def included(klass)
      define_can_handle
      define_instance_methods

      klass.send(:include, instance_mod)
      klass.extend(class_mod)

      self.class.command_handlers << klass

      super
    end

    def define_can_handle
      class_mod.class_exec(commands) do |commands|
        define_method :can_handle? do |message|
          message.start_with?(*commands)
        end
      end
    end

    def define_instance_methods
      instance_mod.class_eval <<-RUBY, __FILE__, __LINE__ + 1
        attr_reader :commands

        def initialize(params)
          @commands = #{commands}
          super(params)
        end

        def command_arguments
          @command_arguments ||= current_message.text.gsub(/^(\#{commands.join('|')})(\s+|$)/, '').split
        end
      RUBY
    end
  end
end
