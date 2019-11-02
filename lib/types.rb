# frozen_string_literal: true

require 'dry-types'

Dry::Types.load_extensions(:maybe)

module Types
  include Dry.Types()
end
