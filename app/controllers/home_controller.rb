class HomeController < ApplicationController
  def index
    @hospitals = Hospital.all
  end
end
