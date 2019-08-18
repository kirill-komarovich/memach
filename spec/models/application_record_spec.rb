# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ApplicationRecord do
  it 'is abstract class' do
    expect(described_class.abstract_class).to be true
  end
end
