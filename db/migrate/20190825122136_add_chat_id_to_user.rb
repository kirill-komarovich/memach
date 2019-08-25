# frozen_string_literal: true

class AddChatIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :chat_id, :integer
  end
end
