class Patients::PatientCardsController < ApplicationController
  before_action :set_patient
  before_action :set_patient_card, only: [:edit, :update]

  def new
    @patient_card = @patient.build_patient_card
  end

  def create
    @patient_card = @patient.build_patient_card(patient_card_params)
    if @patient_card.save
      redirect_to patients_dashboard_path(id: @patient.id), notice: 'Карточка пациента успешно создана.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient_card.update(patient_card_params)
      redirect_to patients_dashboard_path(id: @patient.id), notice: 'Карточка пациента успешно обновлена.'
    else
      render :edit
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_patient_card
    @patient_card = @patient.patient_card
  end

  def patient_card_params
    params.require(:patient_card).permit(:content)
  end
end
