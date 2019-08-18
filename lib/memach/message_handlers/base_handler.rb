# frozen_string_literal: true

module Memach
  module MessageHandlers
    class BaseHandler
      include Import['telegram.bot']

      def self.handle(_message)
        raise NotImplementedError
      end
    end
  end
end
