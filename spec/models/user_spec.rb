require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:name).is_at_least(3) }
  it { is_expected.to validate_length_of(:name).is_at_most(100) }
  it { is_expected.to allow_value('').for(:name) }
  it { is_expected.to have_secure_password }
  it { is_expected.to have_many(:boards) }

  describe 'validations' do
    subject  { create(:user) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'before validation' do
    let(:user) { create(:user) }

    it 'convert email to downcase' do
      expect(user.email).to eq(user.email.downcase)
    end
  end
end
