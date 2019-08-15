# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:telegram_id) }
    it { is_expected.to validate_presence_of(:telegram_id) }
  end
end
