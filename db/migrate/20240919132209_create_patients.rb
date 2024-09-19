class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :full_name, null: false
      t.string :email, null: false
      t.date :date_of_birth, null: false
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
    add_index :patients, :email, unique: true
  end
end
