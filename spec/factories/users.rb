FactoryBot.define do
  factory :user do
    name { SecureRandom.base64(5) }
    email { "#{SecureRandom.uuid}@gmail.com" }
    password { SecureRandom.hex(3) }
    DOB { Date.today }
    gender { ['male', 'female'].sample }
    role { ['buyer'].sample }
    contact { "#{SecureRandom.random_number(9e9).to_i}" }
  end
end
