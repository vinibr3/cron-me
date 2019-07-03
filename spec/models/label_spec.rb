require 'rails_helper'

RSpec.describe Label, type: :model do
  it { is_expected.to(validate_presence_of(:title)) }
  it { is_expected.to(validate_presence_of(:background_color)) }
end
