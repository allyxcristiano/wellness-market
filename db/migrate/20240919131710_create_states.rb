class CreateStates < ActiveRecord::Migration[7.1]
  def change
    create_table :states do |t|
      t.string :full_name, null: false
      t.string :abbreviation, null: false
      t.boolean :service_offered, null: false
      t.integer :minimum_age, null: false

      t.timestamps
    end
    add_index :states, :full_name, unique: true
    add_index :states, :abbreviation, unique: true
  end
end
