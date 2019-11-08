# frozen_string_literal: true

require 'dry-validation'

class NewUserContract < Dry::Validation::Contract
  option :uniquness_validator

  schema do
    required(:first_name).value(:string)
    required(:telegram_id).value(:integer)
    required(:is_bot).value(:bool)

    optional(:chat_id).value(:integer)
    optional(:username).value(:string)
    optional(:last_name).value(:string)
    optional(:language_code).value(:string)
  end

  rule(:telegram_id) do
    key.failure('already exists') unless uniquness_validator.call(values.slice(:telegram_id))
  end
end
