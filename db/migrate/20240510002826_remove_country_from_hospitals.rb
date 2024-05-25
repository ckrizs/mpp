class RemoveCountryFromHospitals < ActiveRecord::Migration[7.1]
  def change
    remove_column :hospitals, :country, :string
  end
end
