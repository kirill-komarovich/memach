# frozen_string_literal: true

ENV['BOT_ENV'] ||= 'test'

require 'rubygems'
require 'bundler'

Bundler.require(:default, :test)
Dotenv.load('.env', '.env.test')
Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }
SimpleCov.start 'bot'

require_relative '../system/container'
require 'dry/system/stubs'

Bot.enable_stubs!
Bot.finalize!
Bot.stub('telegram.bot', DummyBot.new)

RomFactory = ROM::Factory.configure do |config|
  config.rom = Bot['rom']
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
