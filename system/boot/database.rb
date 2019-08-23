# frozen_string_literal: true

Bot.boot(:database) do
  init do
    require 'active_record'
    require 'pg'
  end

  start do
    ActiveRecord::Base.logger = Bot.logger unless Bot.env == :test
    ActiveRecord::Base.establish_connection(Bot.database_config.fetch(Bot.env.to_s))
  end
end
