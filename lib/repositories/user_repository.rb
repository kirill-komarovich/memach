# frozen_string_literal: true

require 'import'

module Repositories
  class UserRepository < ROM::Repository[:users]
    include Import.args[:rom]

    commands :create, mapper: :user

    def create(attributes)
      users.transaction do
        users.command(:create).call(attributes)
      end
    end
  end
end
