# frozen_string_literal: true

require 'models/application_record'

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :telegram_id, presence: true, uniqueness: true
end
