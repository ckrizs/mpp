class AppointmentsController < ApplicationController
  before_action :set_patient, only: [:create]
  before_action :set_appointment, only: [:update]

  def new
    @appointment = @doctor.appointments.new
    @patients = Patient.all
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_dashboard_path(@patient), notice: 'Прием успешно создан.'
    else
      @doctors = Doctor.all
      render 'patients/dashboards/show'
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patient_dashboard_path(@patient), notice: 'Прием успешно обновлен.'
    else
      @doctors = Doctor.all
      render 'patients/dashboards/show'
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :start, :appointment_type, :attended)
  end
end