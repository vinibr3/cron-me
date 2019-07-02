require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to (validate_presence_of(:title)) }
  it { is_expected.to (belong_to(:board)) }
  it { is_expected.to (have_one(:user).through(:board)) }
end
