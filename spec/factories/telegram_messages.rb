# frozen_string_literal: true

FactoryBot.define do
  factory :telegram_message, class: Telegram::Bot::Types::Message do
    sequence(:message_id)
    association :from, factory: :telegram_user
    association :chat, factory: :telegram_chat
    text { FFaker::Lorem.sentence }
    entities { [] }

    trait :bot_command do
      entities { [build(:telegram_message_entity, :bot_command)] }
    end
  end
end
