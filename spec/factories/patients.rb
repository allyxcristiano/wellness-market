# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    date_of_birth { Faker::Date.birthday }
    state { create(:state) }
  end
end
