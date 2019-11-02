# frozen_string_literal: true

require 'models/user'

class UserMapper < ROM::Mapper
  relation :users

  register_as :user

  model User

  attribute :username
end
