FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    category { create(:category) }
    ndc do
      "#{Faker::Number.number(digits: 5)}-#{Faker::Number.number(digits: 4)}-#{Faker::Number.number(digits: 2)}"
    end
    qty { 10 }
    price { 75.00 }
    instructions { Faker::Lorem.sentence }
  end
end
