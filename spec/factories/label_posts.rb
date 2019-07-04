FactoryBot.define do
  factory :label_post do
    label { association(:label) }
    post { association(:post) }
  end
end
