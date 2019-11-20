# frozen_string_literal: true

class UserRepository < ROM::Repository[:users]
  commands :create, mapper: :user

  def create(attributes)
    users.transaction do
      users.command(:create).call(attributes)
    end
  end
end
