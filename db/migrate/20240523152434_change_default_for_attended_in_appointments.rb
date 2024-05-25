class ChangeDefaultForAttendedInAppointments < ActiveRecord::Migration[7.1]
  def change
    change_column_default :appointments, :attended, from: nil, to: false
  end
end
