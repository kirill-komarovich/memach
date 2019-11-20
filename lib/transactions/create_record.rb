# frozen_string_literal: true

require 'transactions/application_transaction'

module Transactions
  class CreateRecord < ApplicationTransaction
    step :validate, with: 'operations.validate'
    step :create, with: 'operations.create'
  end
end
