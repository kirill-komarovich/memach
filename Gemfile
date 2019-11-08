# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '2.6.3'

gem 'activesupport', '~> 6.0'
gem 'dotenv', '~> 2.7', '>= 2.7.5'
gem 'dry-monads', '~> 1.3', '>= 1.3.1'
gem 'dry-system', '~> 0.13.0'
gem 'dry-transaction', '~> 0.13.0'
gem 'dry-validation', '~> 1.3', '>= 1.3.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'rake', '~> 12.3', '>= 12.3.3'
gem 'rom', '~> 5.1', '>= 5.1.2'
gem 'rom-sql', '~> 3.0', '>= 3.0.1'
gem 'telegram-bot-ruby', '~> 0.11.0'

group :development, :test do
  gem 'bundler-audit', '~> 0.6.1'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'ffaker', '~> 2.11'
  gem 'rom-factory', '~> 0.9.1'
  gem 'rspec', '~> 3.8'
  gem 'rubocop', '~> 0.74.0'
end

group :test do
  gem 'simplecov', '~> 0.17.0', require: false
end
