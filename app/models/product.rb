# frozen_string_literal: true

# Represents the Products that will be available depending on the stock within our wellness market.
class Product < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :patients
  has_many :product_allowed_states, dependent: :destroy
  has_many :allowed_states, through: :product_allowed_states, source: :state
end
