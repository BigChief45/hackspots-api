require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController, type: :routing do
  
  describe "routing" do
    
    let(:url) { 'http://api.lvh.me:8080' }
    
    it "routes to auth_user" do
      expect(:post => "#{url}/auth_user").to route_to("api/v1/authentication#authenticate_user", :subdomain => "api")
    end
    
  end
  
end