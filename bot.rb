require 'dotenv/load'
require 'logger'
require 'telegram/bot'

token = ENV.fetch('TOKEN')
logger = Logger.new('/proc/1/fd/1')
logger.level = :DEBUG

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    logger.info message
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
