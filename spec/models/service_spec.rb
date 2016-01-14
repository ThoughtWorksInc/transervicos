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

  it 'does not create service without subarea' do
    service = FactoryGirl.build(:service_without_subarea)
    expect(service).to be_invalid
  end

  it 'does not create service without address' do
    service = FactoryGirl.build(:service_without_address)
    expect(service).to be_invalid
  end
end
