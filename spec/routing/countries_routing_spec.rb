require "rails_helper"

RSpec.describe Admin::Settings, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/settings/countries").to route_to("countries#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/settings/countries/new").to route_to("countries#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/settings/countries/1").to route_to("countries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/settings/countries/1/edit").to route_to("countries#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/settings/countries").to route_to("countries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/settings/countries/1").to route_to("countries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/settings/countries/1").to route_to("countries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/settings/countries/1").to route_to("countries#destroy", :id => "1")
    end
  end
end
