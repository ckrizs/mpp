class RemoveCityFromHospitals < ActiveRecord::Migration[7.1]
  def change
    remove_column :hospitals, :city, :string
  end
end
