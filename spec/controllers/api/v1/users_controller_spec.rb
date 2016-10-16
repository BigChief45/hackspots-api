require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  
  let(:valid_attributes) { FactoryGirl.attributes_for(:user) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:user, password: nil) }
  
  let(:valid_session) {}
  
  before(:each) { request.headers['Accept'] = "application/vnd.localhost.v1" }
  
  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect { post :create, params: { data: { type: 'users', attributes: valid_attributes } }, session: valid_session }.to change(User, :count).by(1)
      end
    end
    
    context "with invalid params" do
      it "does not create the new User" do
        expect { post :create, params: { data: { type: 'users', attributes: invalid_attributes } }, session: valid_session }.not_to change(User, :count)
      end
    end
  end
  
  describe "PUT #update" do
    let(:user) { FactoryGirl.create(:user, password: '12345678', password_confirmation: '12345678') }
    
    context "with valid params" do
      let(:new_attributes) { FactoryGirl.attributes_for(:user, email: 'new_email@domain.com') }
      
      it "updates the requested user" do
        put :update, params: { id: user.to_param, data: { type: 'users', attributes: new_attributes } }, session: valid_session
        user.reload
        expect(user.email).to eq 'new_email@domain.com'
      end
    end
    
    context "with invalid params" do
      it "does not update the requested user" do
        put :update, params: { id: user.to_param, data: { type: 'users', attributes: invalid_attributes } }, session: valid_session
        user.reload
        expect(user.email).not_to eq 'new_email@domain.com'
      end
    end
  end
  
  describe "DELETE #destroy" do
    let!(:user) { FactoryGirl.create(:user) }
    it "destroys the requested User" do
      expect { delete :destroy, params: {id: user.to_param}, session: valid_session }.to change(User, :count).by(-1)
    end
  end
  
end
