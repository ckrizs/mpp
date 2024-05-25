class Doctors::RegistrationsController < Devise::RegistrationsController
  before_action :check_email_domain, only: [:create]

  private

  def check_email_domain
    email_domain = params[:doctor][:email].split('@').last
    unless email_domain == 'karazin.ua'
      redirect_to new_doctor_registration_path, alert: "Реєстрація доступна тільки для поштових адрес на домені karazin.ua"
    end
  end
end