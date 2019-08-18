# frozen_string_literal: true

require 'bundler'
require 'dotenv/load'
require_relative 'container'
require_relative 'import'
require_relative '../lib/memach'

env = ENV.fetch('BOT_ENV', :development).to_sym
Bundler.require(:default, env)

Application.finalize!
Application['memach.runner'].run
