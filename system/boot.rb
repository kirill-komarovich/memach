# frozen_string_literal: true

require 'bundler/setup'
require_relative 'container'
require_relative 'import'
require_relative '../lib/memach'

env = ENV.fetch('BOT_ENV', :development).to_sym
STDOUT.sync = true
Bundler.require(:default, env)
Dotenv.load('.env', ".env.#{env}")

Application.finalize!
Application['memach.runner'].run unless ENV['BOT_CONSOLE']
