# frozen_string_literal: true

module Validators
  class Uniquness
    def initialize(relation)
      @relation = relation
    end

    def call(attributes)
      relation.where(attributes).count.zero?
    end

    private

    attr_reader :relation
  end
end
