# frozen_string_literal: true

class GroupRepository < ROM::Repository[:groups]
  commands :create, delete: :by_pk, mapper: :group

  def create(attributes)
    groups.transaction do
      groups.command(:create).call(attributes)
    end
  end

  def delete(group_id)
    groups.transaction do
      groups.command(:delete).call(group_id)
    end
  end

  def for_user(user_id)
    groups.where(user_id: user_id)
  end
end
