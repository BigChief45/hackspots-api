require "rails_helper"

RSpec.describe Api::V1::SpeedTestsController, type: :routing do
  
  describe "routing" do
    
    let(:url) { 'http://api.lvh.me:8080' }
    
    it "routes to #index" do
      expect(:get => "#{url}/spots/1/speed_tests").to route_to("api/v1/speed_tests#index", :spot_id => "1", :subdomain => "api")
    end
    
    it "routes to #show" do
      expect(:get => "#{url}/spots/1/speed_tests/1").to route_to("api/v1/speed_tests#show", :spot_id => "1", :id => "1", :subdomain => "api")
    end
    
    it "routes to #create" do
      expect(:post => "#{url}/spots/1/speed_tests").to route_to("api/v1/speed_tests#create", :spot_id => "1", :subdomain => "api")
    end
    
    it "routes to #update via PUT" do
      expect(:put => "#{url}/spots/1/speed_tests/1").to route_to("api/v1/speed_tests#update", :spot_id => "1", :id => "1", :subdomain => "api")
    end
    
    it "routes to #update via PATCH" do
      expect(:patch => "#{url}/spots/1/speed_tests/1").to route_to("api/v1/speed_tests#update", :spot_id => "1", :id => "1", :subdomain => "api")
    end
    
    it "routes to #destroy" do
      expect(:delete => "#{url}/spots/1/speed_tests/1").to route_to("api/v1/speed_tests#destroy", :spot_id => "1", :id => "1", :subdomain => "api")
    end
    
  end
  
end