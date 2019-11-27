# frozen_string_literal: true

Bot.boot(:runner) do
  init do
    require 'runner'
  end

  start do |container|
    runner = Runner.new
    container.register('runner', runner)
  end
end
