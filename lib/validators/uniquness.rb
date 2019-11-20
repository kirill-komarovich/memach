# frozen_string_literal: true

require 'import'

module Validators
  class Uniquness
    include Import[:rom]

    def call(attributes)
      relation.where(attributes).count.zero?
    end

    def [](relation)
      @relation = rom.relations[relation]
      self
    end

    private

    attr_reader :relation
  end
end
