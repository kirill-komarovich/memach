# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MessageHandlers::BaseHandler do
  subject { described_class.new(message: {}) }

  describe '#handle' do
    it 'raises NotImplementedError' do
      # expect { subject.handle }.to raise_error NotImplementedError
    end
  end
end
