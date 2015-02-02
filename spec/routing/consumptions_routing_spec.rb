require "rails_helper"

RSpec.describe ConsumptionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/consumptions").to route_to("consumptions#index")
    end

    it "routes to #new" do
      expect(:get => "/consumptions/new").to route_to("consumptions#new")
    end

    it "routes to #show" do
      expect(:get => "/consumptions/1").to route_to("consumptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/consumptions/1/edit").to route_to("consumptions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/consumptions").to route_to("consumptions#create")
    end

    it "routes to #update" do
      expect(:put => "/consumptions/1").to route_to("consumptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/consumptions/1").to route_to("consumptions#destroy", :id => "1")
    end

  end
end
