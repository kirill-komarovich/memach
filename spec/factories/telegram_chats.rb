# frozen_string_literal: true

FactoryBot.define do
  factory :telegram_chat, class: Telegram::Bot::Types::Chat do
    sequence(:id)
  end
end
