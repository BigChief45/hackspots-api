require "rails_helper"

RSpec.describe Api::V1::SpotsController, type: :routing do
  describe "routing" do

    let(:url) { 'http://api.lvh.me:8080' }

    it "routes to #index" do
      expect(:get => "#{url}/spots").to route_to("api/v1/spots#index", :subdomain => "api")
    end

    it "routes to #show" do
      expect(:get => "#{url}/spots/1").to route_to("api/v1/spots#show", :id => "1", :subdomain => "api")
    end

    it "routes to #create" do
      expect(:post => "#{url}/spots").to route_to("api/v1/spots#create", :subdomain => "api")
    end

    it "routes to #update via PUT" do
      expect(:put => "#{url}/spots/1").to route_to("api/v1/spots#update", :id => "1", :subdomain => "api")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "#{url}/spots/1").to route_to("api/v1/spots#update", :id => "1", :subdomain => "api")
    end

    it "routes to #destroy" do
      expect(:delete => "#{url}/spots/1").to route_to("api/v1/spots#destroy", :id => "1", :subdomain => "api")
    end

  end
end
