class AddTitleToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :title, :string
  end
end
