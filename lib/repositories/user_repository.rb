# frozen_string_literal: true

require 'import'

module Repositories
  class UserRepository < ROM::Repository[:users]
    include Import.args[:rom]

    commands :create
  end
end
