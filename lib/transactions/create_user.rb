# frozen_string_literal: true

require 'import'
require 'dry/transaction'
require 'contracts/new_user_contract'
require 'repositories/user_repository'
require 'validators/uniquness'

class CreateUser
  include Dry::Transaction
  include Import['rom']

  step :validate
  step :create

  private

  def validate(input)
    validation = contract.call(input)
    if validation.success?
      Success(input)
    else
      Failure(validation.errors)
    end
  end

  def create(input)
    Success(repository.create(input))
  end

  def contract
    @contract ||= NewUserContract.new(uniquness_validator: uniquness_validator)
  end

  def uniquness_validator
    @uniquness_validator ||= Validators::Uniquness.new(rom.relations[:users])
  end

  def repository
    @repository ||= UserRepository.new(rom)
  end
end
