class CreateJoinTablePatientsProducts < ActiveRecord::Migration[7.1]
  def change
    create_join_table :patients, :products do |t|
      t.index %i[patient_id product_id]
      t.index %i[product_id patient_id]
    end
  end
end
