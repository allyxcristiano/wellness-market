# frozen_string_literal: true

# Represents the Products that will be available depending on the stock within our wellness market.
class Product < ApplicationRecord
  belongs_to :category
end
