class Doctors::DashboardsController < ApplicationController
  before_action :set_doctor

  def show
    @patients = Patient.all
    @appointments = @doctor.appointments.includes(:patient)
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end
