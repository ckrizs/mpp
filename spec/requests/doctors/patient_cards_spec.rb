require 'rails_helper'

RSpec.describe "Doctors::PatientCards", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/doctors/patient_cards/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/doctors/patient_cards/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/doctors/patient_cards/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/doctors/patient_cards/update"
      expect(response).to have_http_status(:success)
    end
  end

end
