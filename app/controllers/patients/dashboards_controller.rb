class Patients::DashboardsController < ApplicationController
  before_action :set_patient

  def show
    @appointments = @patient.appointments.select(:start, :title, :appointment_type, :doctor_id, :attended)
    @doctors = Doctor.all
    @appointment = @patient.appointments.new
    @appointments_data = @appointments.map do |appointment|
      {
        start: appointment.start,
        title: "#{appointment.appointment_type} с доктором #{appointment.doctor.name}",
        attended: appointment.attended
      }
    end
  end

  def update_profile
    if @patient.update(profile_params)
      redirect_to patients_dashboard_path(@patient), notice: 'Профиль успешно обновлен'
    else
      render :show
    end
  end

  private

  def profile_params
    params.require(:patient).permit(:name, :email, :other_attributes)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end