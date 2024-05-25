class AddNameToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :name, :string
  end
end
