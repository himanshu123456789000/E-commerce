FactoryBot.define do
  factory :cart_item do
    count { SecureRandom.random_number(9e0).to_i }

    association :cart
    # association :user
    association :product
  end
end
