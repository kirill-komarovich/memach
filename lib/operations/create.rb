# frozen_string_literal: true

require 'dry/transaction/operation'

module Operations
  class Create
    include Dry::Transaction::Operation

    def call(input, repository:)
      repository.transaction do
        Success(repository.create(input))
      end
    end
  end
end
