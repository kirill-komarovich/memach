# frozen_string_literal: true

require 'types'

class Group < Dry::Struct
  attribute :id, Types::Strict::Integer.optional.meta(primary_key: true)
  attribute :user_id, Types::Strict::Integer
  attribute :vk_id, Types::Strict::Integer
  attribute :title, Types::Strict::String
end
