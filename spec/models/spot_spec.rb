require 'rails_helper'

RSpec.describe Spot, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:spot)).to be_valid
  end
   
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :country }
  it { is_expected.to validate_presence_of :city }
  it { is_expected.to validate_presence_of :address }
  it { is_expected.to validate_presence_of :latitude }
  it { is_expected.to validate_presence_of :longitude }
  it { is_expected.to validate_presence_of :open_hours }
  it { is_expected.to validate_presence_of :wifi }
  it { is_expected.to validate_presence_of :power }
   
  it { is_expected.to have_many :speed_tests } 
end
