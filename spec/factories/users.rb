# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { FFaker::Internet.unique.user_name }
    telegram_id { build(:telegram_user).id }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    language_code { FFaker::Locale.code.downcase }
    is_bot { false }
  end
end
