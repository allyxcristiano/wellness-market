# frozen_string_literal: true

# Represents the Patients that will register and buy products within our wellness market.
class Patient < ApplicationRecord
  belongs_to :state
  has_and_belongs_to_many :products, before_add: :validate_product_allowed_in_state

  private

  def validate_product_allowed_in_state(product)
    allowed_states = product.product_allowed_states.pluck(:state_id)

    return if allowed_states.include?(state.id)

    raise ActiveRecord::Rollback, "Product #{product.name} cannot be sold to patients in #{state.full_name}"
  end
end
