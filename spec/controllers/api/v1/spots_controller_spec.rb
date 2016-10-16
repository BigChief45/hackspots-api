require 'rails_helper'

RSpec.describe Api::V1::SpotsController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:spot) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:spot, name: nil) }

  let(:valid_session) { {} }
  
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Spot" do
        expect { post :create, params: { data: { type: 'spots', attributes: valid_attributes } }, session: valid_session }.to change(Spot, :count).by(1)
      end
    end

    context "with invalid params" do
      it "it does not create a new spot" do
        expect { post :create, params: { data: { type: 'spots', attributes: invalid_attributes } }, session: valid_session }.not_to change(Spot, :count)
      end
    end
  end

  describe "PUT #update" do
    let(:spot) { FactoryGirl.create(:spot) }
    context "with valid params" do
      let(:new_attributes) { FactoryGirl.attributes_for(:spot, name: 'Piccolo Cafe', country: 'Taiwan', city: 'Hsinchu') }

      it "updates the requested spot" do
        put :update, params: {id: spot.to_param, data: { type: 'spots', attributes: new_attributes } }, session: valid_session
        spot.reload
        expect(spot.name).to eq 'Piccolo Cafe'
      end

    end

    context "with invalid params" do
      it "it does not update the spot" do
        put :update, params: {id: spot.to_param, data: { type: 'spots', attributes: invalid_attributes } }, session: valid_session
        spot.reload
        expect(spot.name).to eq 'Embaixado'
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:spot) { FactoryGirl.create(:spot) }
    it "destroys the requested spot" do
      expect { delete :destroy, params: {id: spot.to_param}, session: valid_session }.to change(Spot, :count).by(-1)
    end
  end

end
