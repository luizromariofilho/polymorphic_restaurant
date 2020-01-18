FactoryBot.define do
  factory :restaurant do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.phone_number  }
    website { Faker::Internet.url }
  end
end
