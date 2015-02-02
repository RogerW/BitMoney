require 'rails_helper'

RSpec.describe "Consumptions", :type => :request do
  describe "GET /consumptions" do
    it "works! (now write some real specs)" do
      get consumptions_path
      expect(response).to have_http_status(200)
    end
  end
end
