class HomeController < ApplicationController
  def index
    if params[:search].present?
      @hospitals = Hospital.where('name LIKE ?', "%#{params[:search]}%")
    else
      @hospitals = Hospital.all
    end
  end
end