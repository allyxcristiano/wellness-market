class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :category, null: false, foreign_key: true
      t.string :ndc, null: false, limit: 11
      t.integer :qty, null: false, default: 0
      t.float :price, null: false
      t.string :instructions

      t.timestamps
    end
    add_index :products, :name, unique: true
    add_index :products, :ndc, unique: true
  end
end
