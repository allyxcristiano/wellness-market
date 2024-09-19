# frozen_string_literal: true

# Represents the Patients that will register and buy products within our wellness market.
class Patient < ApplicationRecord
  belongs_to :state
  has_and_belongs_to_many :categories
end
