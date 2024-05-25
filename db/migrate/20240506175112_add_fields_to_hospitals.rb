class AddFieldsToHospitals < ActiveRecord::Migration[7.1]
  def change
    add_column :hospitals, :size, :integer
    add_column :hospitals, :visibility, :integer
    add_column :hospitals, :rich_files, :integer
    add_column :hospitals, :scholar, :integer
  end
end
