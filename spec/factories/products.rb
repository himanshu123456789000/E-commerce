FactoryBot.define do
  factory :product do
    name { SecureRandom.base64(5) }
    price { "#{SecureRandom.random_number(9e3).to_i}" }
    details { SecureRandom.base64(10) }

    association :user
  end
end
