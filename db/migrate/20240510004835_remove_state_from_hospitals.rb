class RemoveStateFromHospitals < ActiveRecord::Migration[7.1]
  def change
    remove_column :hospitals, :state, :string
  end
end
