# frozen_string_literal: true

FactoryBot.define do
  factory :telegram_user, class: Telegram::Bot::Types::User do
    sequence(:id, User.last&.telegram_id || 0)
    is_bot { false }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    username { FFaker::Internet.user_name }
    language_code { FFaker::Locale.code.downcase }
  end
end
