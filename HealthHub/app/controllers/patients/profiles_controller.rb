class Patients::ProfilesController < ApplicationController
  before_action :store_current_location, only: [:edit]
  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update_without_password(patient_params)
      redirect_back(fallback_location: root_path, notice: 'Профиль успешно обновлен')
    else
      flash.now[:alert] = 'Произошла ошибка при обновлении профиля'
      render :edit
    end
  end

  private

  def store_current_location
    store_location_for(:user, request.fullpath)
  end

  def patient_params
    params.require(:patient).permit(:name, :email)
  end
end