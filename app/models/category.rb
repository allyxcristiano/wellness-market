# frozen_string_literal: true

# Represents the Categories of the products within our wellness market.
class Category < ApplicationRecord
  has_many :products
end
