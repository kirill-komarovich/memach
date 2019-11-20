# frozen_string_literal: true

require 'dry/transaction/operation'

module Operations
  class Validate
    include Dry::Transaction::Operation

    def call(input, contract:)
      validation = contract.call(input)
      validation.success? ? Success(input) : Failure(validation.errors)
    end
  end
end
