class Doctors::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:update]

  def update
    if @appointment.update(appointment_params)
      redirect_to doctors_dashboard_path(@appointment.doctor), notice: 'Посещение успешно отмечено.'
    else
      redirect_to doctors_dashboard_path(@appointment.doctor), alert: 'Не удалось отметить посещение.'
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:attended)
  end
end