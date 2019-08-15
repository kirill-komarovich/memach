# frozen_string_literal: true

Application.boot(:database) do
  init do
    require 'active_record'
    require 'pg'
  end

  start do |container|
    ActiveRecord::Base.logger = container.config.logger unless container.config.env == :test
    ActiveRecord::Base.establish_connection(container.config.database)
  end
end
