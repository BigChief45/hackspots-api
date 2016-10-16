require 'rails_helper'

RSpec.describe "Spots", type: :request do
  
  before { host! "api.lvh.me:8080" }
  
  let(:user) { FactoryGirl.create(:user, email: 'user@domain.com', password: '12345678', password_confirmation: '12345678') }
  
  before :each do
    post '/auth_user', params: { email: user.email, password: user.password }
    @auth_token = JSON.parse(response.body)['auth_token']
  end
  
  let(:headers) { {"Accept": "application/vnd.localhost.v1"} }
  
  describe "GET /spots" do
    it "returns all the spots" do
      FactoryGirl.create(:spot, name: 'Piccolo Cafe')
      FactoryGirl.create(:spot, name: 'Ben Ben Cafe')
      
      get '/spots', headers: headers
      
      expect(response).to have_http_status 200
      
      body = JSON.parse(response.body)
      spot_names = body['data'].map { |spot| spot['attributes']['name'] }
      
      expect(spot_names).to match_array(['Piccolo Cafe', 'Ben Ben Cafe'])  
    end
  end
  
  describe "GET /spots/:id" do
    it "returns the specified spot" do
      FactoryGirl.create(:spot, name: 'Piccolo Cafe')
      
      get '/spots/1', headers: { 'Accept': 'application/vnd.localhost.v1' }
      
      expect(response).to have_http_status 200
      
      body = JSON.parse(response.body)
      spot_name = body['data']['attributes']['name']
      
      expect(spot_name).to eq('Piccolo Cafe')
    end
  end
  
  describe "POST /spots" do
    it "creates and returns the new spot" do
      headers["Authorization"] = "Bearer #{@auth_token}"
      headers["Content-Type"] = "application/vnd.api+json"
      
      new_spot = {
        data: {
          type: 'spots',
          attributes: {
            name: 'Piccolo Cafe', 
            description: 'Coffee shop', 
            country: 'Taiwan', 
            city: 'Hsinchu', 
            address: 'JianXin Road 5th street', 
            latitude: 25.123532, 
            longitude: 100.45454, 
            open_hours: 'Mon 12:30pm - 1:00am, Tue-Sun 10:00am - 1:00am', 
            wifi: true, 
            power: true
          }
        }
      }
      
      post '/spots', params: new_spot.to_json, headers: headers
      
      expect(response).to have_http_status 201
      
      body = JSON.parse(response.body)
      spot_name = body['data']['attributes']['name']
      
      expect(spot_name).to eq 'Piccolo Cafe'
      
    end
  end
  
  describe "PUT/PATCH /spots/:id" do
    it "updates the specified spot" do
      headers["Authorization"] = "Bearer #{@auth_token}"
      headers["Content-Type"] = "application/vnd.api+json"
      
      FactoryGirl.create(:spot, name: 'Piccolo Cafe', id: 1)
      
      updated_spot = {
        data: {
          type: 'spots',
          id: 1,
          attributes: {
            name: 'Cama Cafe'
          }
        }
      }
      
      put '/spots/1', params: updated_spot.to_json, headers: headers
      
      expect(response).to have_http_status 200
      
      body = JSON.parse(response.body)
      spot_name = body['data']['attributes']['name']
      
      expect(spot_name).to eq 'Cama Cafe'
    end
  end
  
  describe "DELETE /spots/:id" do
    it "deletes the specified spot" do
      headers["Authorization"] = "Bearer #{@auth_token}"
      headers["Content-Type"] = "application/vnd.api+json"
      
      FactoryGirl.create(:spot, name: 'Cama Cafe', id: 1)
      
      delete '/spots/1', headers: headers
      
      expect(response).to have_http_status 204
    end
  end
end
