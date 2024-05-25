require 'rails_helper'

RSpec.describe "Doctors::Dashboards", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/doctors/dashboards/show"
      expect(response).to have_http_status(:success)
    end
  end

end
