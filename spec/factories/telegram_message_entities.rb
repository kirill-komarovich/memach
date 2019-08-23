# frozen_string_literal: true

FactoryBot.define do
  factory :telegram_message_entity, class: Telegram::Bot::Types::MessageEntity do
    type { nil }

    trait :bot_command do
      type { MessageHandlers::BOT_COMMAND }
    end
  end
end
