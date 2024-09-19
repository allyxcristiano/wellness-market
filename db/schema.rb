# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_19_164004) do
  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "patients", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.date "date_of_birth", null: false
    t.integer "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["state_id"], name: "index_patients_on_state_id"
  end

  create_table "patients_products", id: false, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "product_id", null: false
    t.index ["patient_id", "product_id"], name: "index_patients_products_on_patient_id_and_product_id"
    t.index ["product_id", "patient_id"], name: "index_patients_products_on_product_id_and_patient_id"
  end

  create_table "product_allowed_states", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_allowed_states_on_product_id"
    t.index ["state_id"], name: "index_product_allowed_states_on_state_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category_id", null: false
    t.string "ndc", limit: 11, null: false
    t.integer "qty", default: 0, null: false
    t.float "price", null: false
    t.string "instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["name"], name: "index_products_on_name", unique: true
    t.index ["ndc"], name: "index_products_on_ndc", unique: true
  end

  create_table "states", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "abbreviation", null: false
    t.boolean "service_offered", null: false
    t.integer "minimum_age", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbreviation"], name: "index_states_on_abbreviation", unique: true
    t.index ["full_name"], name: "index_states_on_full_name", unique: true
  end

  add_foreign_key "patients", "states"
  add_foreign_key "product_allowed_states", "products"
  add_foreign_key "product_allowed_states", "states"
  add_foreign_key "products", "categories"
end
