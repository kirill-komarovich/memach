# frozen_string_literal: true

Bot.boot(:telegram) do
  init do |container|
    require 'telegram/bot'

    token = ENV.fetch('BOT_TOKEN')
    bot = Telegram::Bot::Client.new(token, logger: container.logger)
    register('telegram.bot', bot)
  end
end
