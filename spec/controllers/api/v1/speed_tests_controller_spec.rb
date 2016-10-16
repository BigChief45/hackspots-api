require 'rails_helper'

RSpec.describe Api::V1::SpeedTestsController, type: :controller do

  let(:spot) { FactoryGirl.create(:spot) }
  
  let(:valid_attributes) { FactoryGirl.attributes_for(:speed_test, spot_id: spot) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:speed_test, grade: 'C', download_speed: nil, spot_id: spot) }

  let(:valid_session) {}
  
  describe "POST #create" do
    context "with valid params" do
      it "creates a new speed test" do
        expect { post :create, params: { spot_id: spot, data:{ type: 'speed_tests', attributes: valid_attributes} }, session: valid_session }.to change(SpeedTest, :count).by(1)
      end
    end
    
    context "with invalid params" do
      it "does not create a new speed test" do
        expect { post :create, params: { spot_id: spot, data:{ type: 'speed_tests', attributes: invalid_attributes} }, session: valid_session }.not_to change(SpeedTest, :count)
      end
    end
  end
  
  describe "PUT #update" do
    let(:speed_test) { FactoryGirl.create(:speed_test, grade: 'F') }
    
    context "with valid params" do
      let(:new_attributes) { FactoryGirl.attributes_for(:speed_test, grade: 'A') }  
      
      it "updates the requested speed test" do
        put :update, params: { spot_id: spot, id: speed_test.to_param, data:{ type: 'speed_tests', attributes: new_attributes} }, session: valid_session
        speed_test.reload
        expect(speed_test.grade).to eq 'A'
      end
    end
    
    context "with invalid params" do
      it "does not update the requested speed test" do
        put :update, params: { spot_id: spot, id: speed_test.to_param, data:{ type: 'speed_tests', attributes: invalid_attributes} }, session: valid_session
        speed_test.reload
        expect(speed_test.grade).to eq 'F'
      end
    end
  end
  
  describe "DELETE #destroy" do
    let!(:speed_test) { FactoryGirl.create(:speed_test) } 
    
    it "deletes the requested speed test" do
      expect { delete :destroy, params: { spot_id: spot, id: speed_test.to_param }, session: valid_session }.to change(SpeedTest, :count).by(-1)
    end
  end
end
