# frozen_string_literal: true

class GroupRepository < ROM::Repository[:groups]
  commands :create, delete: :by_pk

  def for_user(user_id)
    groups.where(user_id: user_id)
  end
end
