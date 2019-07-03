require 'rails_helper'

RSpec.describe LabelPost, type: :model do
  it { is_expected.to belong_to(:label).required }
  it { is_expected.to belong_to(:post).required }
end
