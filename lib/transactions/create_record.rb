# frozen_string_literal: true

require 'dry/transaction'

class CreateRecord
  include Dry::Transaction

  step :validate
  step :create

  private

  def validate(input, contract:)
    validation = contract.call(input)
    if validation.success?
      Success(input)
    else
      Failure(validation.errors)
    end
  end

  def create(input, repository:)
    Success(repository.create(input))
  end
end
