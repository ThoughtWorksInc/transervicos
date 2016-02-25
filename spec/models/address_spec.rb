require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'belongs to a service' do
    address = FactoryGirl.create(:address)
    expect(address).to belong_to(:service)
  end

  it 'does not create address without state' do
    address = build(:address, state: nil)
    expect(address).to be_invalid
  end

  it 'does not create address with an inexistent state' do
    address = build(:address, state_id: 999)
    expect(address).to be_invalid
  end

  it 'does not create address without city' do
    address = build(:address, city: nil)
    expect(address).to be_invalid
  end

  it 'does not create address with an inexistent city' do
    address = build(:address, city_id: 999)
    expect(address).to be_invalid
  end
end
