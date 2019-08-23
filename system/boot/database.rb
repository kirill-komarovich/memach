# frozen_string_literal: true

Application.boot(:database) do
  init do
    require 'active_record'
    require 'pg'
  end

  start do
    ActiveRecord::Base.logger = Application.logger unless Application.env == :test
    ActiveRecord::Base.establish_connection(Application.database_config.fetch(Application.env.to_s))
  end
end
