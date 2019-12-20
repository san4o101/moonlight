require 'rails_helper'

RSpec.describe "Cities", type: :request do
  describe "GET /cities" do
    it "works! (now write some real specs)" do
      get admin_settings_cities_path
      expect(response).to have_http_status(200)
    end
  end
end
