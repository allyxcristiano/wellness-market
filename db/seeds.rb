# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed States
STATES.each do |state|
  State.create!(
    full_name: state[0],
    abbreviation: state[1],
    service_offered: state[2],
    minimum_age: state[3]
  )
end

puts 'States seeded successfully.'

# Seed Categories
CATEGORIES.each do |category|
  Category.create!(name: category)
end

puts 'Categories seeded successfully.'

# Seed Products
PRODUCTS.each do |product|
  category = Category.find_by(name: product[:category])
  if category.nil?
    puts "Category #{category} not found, skipping."
    next
  end
  Product.create!(
    name: product[:name],
    category:,
    ndc: product[:ndc],
    qty: product[:qty],
    price: product[:price],
    instructions: product[:instructions]
  )
end

puts 'Products seeded successfully.'

# Seed Patients with random states and categories
10.times do
  state = State.order('RANDOM()').first

  if state.nil?
    puts "State #{state} not found, skipping."
    next
  end

  patient = Patient.create!(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    date_of_birth: Faker::Date.birthday,
    state:
  )

  # Assign random categories (1 to 3 categories per patient)
  products = Product.order('RANDOM()').limit(rand(1..3))

  # Allowing products to the state of this patient
  products.each { ProductAllowedState.create!(state_id: state.id, product_id: _1.id) }

  patient.products << products
end

puts 'Patients with it\'s products seeded successfully.'
