class Doctors::ProfilesController < ApplicationController
  before_action :authenticate_doctor!
  before_action :set_doctor

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctors_dashboard_path, notice: 'Профиль успешно обновлен.'
    else
      render :edit
    end
  end

  private

  def set_doctor
    @doctor = current_doctor
  end

  def doctor_params
    params.require(:doctor).permit(:name, :email)
  end
end