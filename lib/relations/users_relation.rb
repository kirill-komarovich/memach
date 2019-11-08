# frozen_string_literal: true

class UsersRelation < ROM::Relation[:sql]
  gateway :default

  schema(:users, infer: true)
end
