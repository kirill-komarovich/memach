# frozen_string_literal: true

require 'simplecov'

SimpleCov.profiles.define 'bot' do
  load_profile 'test_frameworks'

  add_filter %r{^/config/}
  add_filter %r{^/db/}
  add_filter %r{^/vendor/}

  add_group 'Message handles', 'lib/message_handlers'
  add_group 'Models', 'lib/models'
  add_group 'Libraries', 'lib/'
  add_group 'System', 'system'

  track_files 'lib/**/*.rb'
end
