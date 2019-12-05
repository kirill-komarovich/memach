# frozen_string_literal: true

Bot.boot(:runner) do
  start do
    require 'runner'

    register('runner', Runner.new)
  end
end
