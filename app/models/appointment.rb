class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :doctor_id, presence: true
  validates :start, presence: true
  validates :appointment_type, presence: true

  def title
    "#{appointment_type} с доктором #{doctor.name}"
  end

end
