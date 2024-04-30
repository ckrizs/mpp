class CreateHospitals < ActiveRecord::Migration[7.1]
  def change
    create_table :hospitals do |t|
      t.integer :rank
      t.string :name
      t.string :country
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
