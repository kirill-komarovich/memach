# frozen_string_literal: true

require 'import'

module Validators
  class DatabaseUniquness
    include Import[:rom]

    def call(relation, attributes)
      rom.relations[relation].where(attributes).count.zero?
    end
  end
end
