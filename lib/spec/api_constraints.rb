require 'rails_helper'

describe ApiContraints do
  let(:api_constraints_v1) { ApiContraints.new(version: 1, default: true) }
  
  describe "matches?" do
    
    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'localhost.com', headers: { "Accept" => "application/vnd.localhost.v1"} )
      expect(api_constraints_v1.matches?(request)).to be_truthy
    end
    
    it "returns the default version when 'default' option is specified" do
      request = double(host: 'localhost.com')
      expect(api_constraints_v1.matches?(request)).to be_truthy
    end
    
  end
end