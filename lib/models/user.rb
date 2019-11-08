# frozen_string_literal: true

require 'types'

class User < Dry::Struct
  attribute :id, Types::Strict::Integer.optional.meta(primary_key: true)
  attribute :telegram_id, Types::Strict::Integer
  attribute :first_name, Types::Strict::String
  attribute :is_bot, Types::Strict::Bool
  attribute :chat_id, Types::Strict::Integer.optional
  attribute :username, Types::Strict::String.optional
  attribute :last_name, Types::Strict::String.optional
  attribute :language_code, Types::Strict::String.optional
end
