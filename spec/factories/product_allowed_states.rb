FactoryBot.define do
  factory :product_allowed_state do
    product { create(:product) }
    state { create(:state) }
  end
end
