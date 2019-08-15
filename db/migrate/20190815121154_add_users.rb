# frozen_string_literal: true

class AddUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.integer :telegram_id, null: false
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :language_code, null: false, default: ''
      t.boolean :is_bot, null: false, default: false
    end

    add_index :users, :username, unique: true
    add_index :users, :telegram_id, unique: true
  end
end
