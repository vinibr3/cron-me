FactoryBot.define do
  factory :label do
    title { Faker::Lorem.sentence }
    background_color { "#FFF" }
    user { association(:user) }
  end
end
