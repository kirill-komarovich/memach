# frozen_string_literal: true

class UserRepository < ROM::Repository[:users]
  commands :create, update: :by_pk, delete: :by_pk, mapper: :user

  def create(attributes)
    users.transaction do
      users.command(:create).call(attributes)
    end
  end
end
