FactoryBot.define do
  factory :board do
    style { }
    active { true }
    title { Faker::Name.name }
    description { Faker::Loren.sentence }
    priority { Faker::Number.digit.to_i }
    user { create(:user) }
  end
end
