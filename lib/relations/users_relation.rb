# frozen_string_literal: true

class UsersRelation < ROM::Relation[:sql]
  schema(:users, infer: true) do
    associations do
      has_many :groups
    end
  end
end
