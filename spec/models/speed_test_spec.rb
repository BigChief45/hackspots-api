require 'rails_helper'

RSpec.describe SpeedTest, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:speed_test)).to be_valid
  end
  
  it { is_expected.to validate_presence_of :download_speed }
  it { is_expected.to validate_presence_of :upload_speed }
  it { is_expected.to validate_presence_of :ping }
  it { is_expected.to validate_presence_of :grade }
  it { is_expected.to validate_presence_of :isp }
  it { is_expected.to validate_presence_of :spot }
  
  it { is_expected.to belong_to :spot }
end
