# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :groups do
      primary_key :id
      column :title, String, null: false, default: ''
      column :vk_id, Integer, null: false
      column :user_id, Integer, null: false

      index :vk_id, unique: true
      index :user_id
      index :title
    end
  end
end
