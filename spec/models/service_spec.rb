require 'rails_helper'

RSpec.describe Service, type: :model do
  it 'has one address' do
    service = FactoryGirl.create(:service)
    expect(service).to have_one(:address)
  end

  it 'properly saves address in user attributes' do
    service = FactoryGirl.create(:service)
    expect(service.address).not_to be_nil
  end
end
