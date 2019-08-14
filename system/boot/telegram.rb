# frozen_string_literal: true

Application.boot(:telegram) do
  init do
    require 'telegram/bot'
  end

  start do |container|
    bot = Telegram::Bot::Client.new(container.config.token, logger: Application.logger)
    container.register('telegram.bot', bot)
  end
end
