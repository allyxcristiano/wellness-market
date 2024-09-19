class CreateProductAllowedStates < ActiveRecord::Migration[7.1]
  def change
    create_table :product_allowed_states do |t|
      t.references :product, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
