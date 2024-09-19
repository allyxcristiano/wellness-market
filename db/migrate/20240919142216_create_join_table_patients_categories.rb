class CreateJoinTablePatientsCategories < ActiveRecord::Migration[7.1]
  def change
    create_join_table :patients, :categories do |t|
      t.index %i[patient_id category_id]
      t.index %i[category_id patient_id]
    end
  end
end
