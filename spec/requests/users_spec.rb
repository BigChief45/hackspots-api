require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  before { host! "api.lvh.me:8080" }
  
  describe "GET /users" do
    it "returns all users" do
      FactoryGirl.create(:user, email: 'chucknorris@domain.com')
      FactoryGirl.create(:user, email: 'jetlee@domain.com')
      
      get '/users', headers: { 'Accept': 'application/vnd.localhost.v1' }
      
      expect(response).to have_http_status 200
      
      body = JSON.parse(response.body)
      
      user_emails = body['data'].map { |user| user['attributes']['email'] }
      
      expect(user_emails).to match_array(['chucknorris@domain.com', 'jetlee@domain.com'])
    end
  end
  
  describe "GET /users/:id" do
    it "returns the requested user" do
      FactoryGirl.create(:user, email: 'pabloescobar@domain.com')
      
      get '/users/1', headers: { 'Accept': 'application/vnd.localhost.v1' }
      
      expect(response).to have_http_status 200
      
      body = JSON.parse(response.body)
      user_email = body['data']['attributes']['email']
      
      expect(user_email).to eq 'pabloescobar@domain.com'
      
    end
  end
  
  describe "POST /users" do
    pending "Need fix for ActionController::UnknownFormat"
    it "creates and returns the new user" do
      new_user = {
        data: {
          type: 'users',
          attributes: {
            email: 'obama@domain.com',
            password: '12345678',
            password_confirmation: '12345678'
          }
        }
      }
      new_user = {}
      post '/users', params: new_user.to_json, headers: { 'Accept': 'application/vnd.localhost.v1', 'Content-Type': 'application/vnd.api+json' }
      
      expect(response).to have_http_status 201
      
      body = JSON.parse(response.body)
      user_email = body['data']['attributes']['email']
      
      expect(user_email).to eq 'obama@domain.com'
    end
  end
  
  describe "PUT/PATCH /users/:id" do
    it "updates the requested user" do
      FactoryGirl.create(:user, id: 1)
      
      updated_user = {
        data: {
          type: 'users',
          attributes: {
            email: 'newemail@domain.com'
          }
        }
      }
      
      put '/users/1', params: updated_user.to_json, headers: { 'Accept': 'application/vnd.localhost.v1', 'Content-Type': 'application/vnd.api+json' }
      
      expect(response).to have_http_status 200
      
      body = JSON.parse(response.body)
      user_email = body['data']['attributes']['email']
      
      expect(user_email).to eq 'newemail@domain.com'
      
    end
  end
  
  describe "DELETE /users/:id" do
    it "deletes the requested user" do
      FactoryGirl.create(:user, id: 1)
      
      delete '/users/1', headers: { 'Accept': 'application/vnd.localhost.v1' }
      
      expect(response).to have_http_status 204
    end
  end
end