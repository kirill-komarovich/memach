# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :telegram_id, Integer, null: false
      column :first_name, String, null: false, default: ''
      column :is_bot, TrueClass, null: false, default: false
      column :username, String, default: ''
      column :last_name, String, default: ''
      column :language_code, String, default: ''
      column :chat_id, Integer

      index :telegram_id, unique: true
      index :username
    end
  end
end
