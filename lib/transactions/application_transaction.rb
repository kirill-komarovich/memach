# frozen_string_literal: true

require 'dry/transaction'

module Transactions
  class ApplicationTransaction
    include Dry::Transaction(container: Bot)
  end
end
