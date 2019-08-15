# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Memach::MessageHandlers::BaseHandler do
  describe '.handle' do
    let(:message) { double }

    it 'raises NotImplementedError' do
      expect { described_class.handle(message) }.to raise_error NotImplementedError
    end
  end
end
