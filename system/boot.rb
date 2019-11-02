# frozen_string_literal: true

require 'bundler/setup'
require_relative 'container'
require_relative 'import'
require_relative '../lib/memach'

STDOUT.sync = true
Bundler.require(:default, Bot.env)
Dotenv.load('.env', ".env.#{Bot.env}")

Bot.finalize!
Bot['memach.runner'].run unless ENV['BOT_CONSOLE']
