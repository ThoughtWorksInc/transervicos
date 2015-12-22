require 'rails_helper'

RSpec.describe Service, type: :model do
  it "has one address" do 
  	service = FactoryGirl.create(:service)
  	expect(service).to have_one(:address)
  end
end
