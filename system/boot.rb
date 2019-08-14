# frozen_string_literal: true

require 'bundler/setup'
require 'dotenv/load'
require_relative 'container'
require_relative 'import'
require_relative '../lib/memach'

Application.finalize!
Application['memach.runner'].run
