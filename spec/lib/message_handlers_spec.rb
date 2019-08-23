# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MessageHandlers do
  describe '.handle' do
    let(:message) { double }
    let(:start_handler) { double }

    before do
      allow(MessageHandlers::StartHandler).to receive(:new)
        .with(message: message)
        .and_return(start_handler)
    end

    it 'runs message handlers' do
      expect(start_handler).to receive(:handle)

      described_class.handle(message)
    end
  end
end
