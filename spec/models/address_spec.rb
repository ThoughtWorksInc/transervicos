require 'rails_helper'

RSpec.describe Address, type: :model do
	it "belongs to a service" do 
  	address = FactoryGirl.create(:address)
  	expect(address).to belong_to(:service)
  end
end
