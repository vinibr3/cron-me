FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    conclusion_deadline { Faker::Date.forward(30) }
    conclusion_date { Faker::Date.between(Time.current, conclusion_deadline) }
    board { association(:board) }
  end
end
