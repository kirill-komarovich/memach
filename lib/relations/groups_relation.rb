# frozen_string_literal: true

class GroupsRelation < ROM::Relation[:sql]
  schema(:groups, infer: true) do
    associations do
      belongs_to :user
    end
  end
end
