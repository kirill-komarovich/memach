# frozen_string_literal: true

ENV['BOT_ENV'] ||= 'test'

require 'rubygems'
require 'bundler'

Bundler.require(:default, :test)
require_relative '../system/container'
require 'dry/system/stubs'

Application.enable_stubs!
Application.finalize!
Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }
require 'simplecov'

SimpleCov.start do
  add_filter %r{^/spec/}
  add_filter %r{^/config/}
  add_filter %r{^/db/}

  add_group 'Message handles', 'lib/memach/message_handlers'
  add_group 'Models', 'lib/models'

  track_files 'lib/**/*.rb'
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
