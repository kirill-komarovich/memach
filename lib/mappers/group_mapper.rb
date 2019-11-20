# frozen_string_literal: true

require 'models/group'

class GroupMapper < ROM::Mapper
  relation :groups
  register_as :group
  model Group
end
