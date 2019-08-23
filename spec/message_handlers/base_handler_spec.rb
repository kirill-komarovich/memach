# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MessageHandlers::BaseHandler do
  describe '.handle' do
    it 'raises NotImplementedError' do
      expect { described_class.handle }.to raise_error NotImplementedError
    end
  end
end
