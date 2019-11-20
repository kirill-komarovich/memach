# frozen_string_literal: true

require 'dry-validation'
require 'import'

module Contracts
  class NewUserContract < Dry::Validation::Contract
    include Import['validators.uniquness']

    option :uniquness

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
      key.failure('already exists') unless uniquness[:users].call(values.slice(:telegram_id))
    end
  end
end
