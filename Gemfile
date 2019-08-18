# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '2.6.3'

gem 'activerecord', '~> 5.2', '>= 5.2.3'
gem 'activesupport', '~> 5.2', '>= 5.2.3'
gem 'dotenv', '~> 2.7', '>= 2.7.5'
gem 'dry-system', '~> 0.12.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'rake', '~> 12.3', '>= 12.3.3'
gem 'telegram-bot-ruby', '~> 0.11.0'

group :development, :test do
  gem 'bundler-audit', '~> 0.6.1'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot', '~> 5.0', '>= 5.0.2'
  gem 'ffaker', '~> 2.11'
  gem 'rspec', '~> 3.8'
  gem 'rubocop', '~> 0.74.0'
end

group :test do
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  gem 'simplecov', '~> 0.17.0', require: false
end
