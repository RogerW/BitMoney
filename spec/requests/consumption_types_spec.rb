require 'rails_helper'

RSpec.describe "ConsumptionTypes", :type => :request do
  describe "GET /consumption_types" do
    it "works! (now write some real specs)" do
      get consumption_types_path
      expect(response).to have_http_status(200)
    end
  end
end
