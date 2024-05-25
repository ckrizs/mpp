class AddAttendedToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :attended, :boolean
  end
end
