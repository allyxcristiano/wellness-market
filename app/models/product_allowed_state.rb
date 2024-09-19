# frozen_string_literal: true

# Represents the allowed states in which a product can be sold within our wellness market.
# A product can have multiple rows in the table mapped to this model, each representing an allowed state.
class ProductAllowedState < ApplicationRecord
  belongs_to :product
  belongs_to :state
end
