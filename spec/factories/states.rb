# frozen_string_literal: true

FactoryBot.define do
  factory :state do
    full_name { Faker::Address.state }
    abbreviation { Faker::Address.state_abbr }
    service_offered { true }
    minimum_age { Faker::Number.between(from: 16, to: 21) }
  end
end
