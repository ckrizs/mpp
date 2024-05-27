class HomeController < ApplicationController
  def index
    @hospitals = HospitalSearchQuery.new(params).call
  end
end
