require 'rails_helper'

RSpec.describe Board, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_most(100) }
  it { is_expected.to validate_numericality_of(:priority).only_integer }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_uniqueness_of(:title).case_insensitive.scoped_to(:user_id) }
end
