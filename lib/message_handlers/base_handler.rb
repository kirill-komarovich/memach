# frozen_string_literal: true

require 'import'

module MessageHandlers
  class BaseHandler
    include Import['telegram.bot']

    def self.handle
      raise NotImplementedError
    end
  end
end
