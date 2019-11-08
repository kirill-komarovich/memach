# frozen_string_literal: true

Bot.boot(:telegram) do
  init do
    require 'telegram/bot'
  end

  start do |container|
    bot = Telegram::Bot::Client.new(container.config.token, logger: container.logger)
    container.register('telegram.bot', bot)
  end
end
