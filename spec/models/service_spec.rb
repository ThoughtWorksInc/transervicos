require 'rails_helper'

RSpec.describe Service, type: :model do
  context 'with valid attributes'do
    it 'has one address' do
      service = FactoryGirl.create(:service)
      expect(service).to have_one(:address)
    end

    it 'properly saves address in user attributes' do
      service = FactoryGirl.create(:service)
      expect(service.address).not_to be_nil
    end
  end

  context 'with invalid attributes' do
    it 'does not create service without subarea' do
      service = FactoryGirl.build(:service_without_subarea)
      expect(service).to be_invalid
    end

    it 'does not create service without address' do
      service = FactoryGirl.build(:service_without_address)
      expect(service).to be_invalid
    end

    it 'does not create service without name' do
      service = FactoryGirl.build(:service, name: nil)
      expect(service).to be_invalid
    end

    it 'does not create service without description' do
      service = FactoryGirl.build(:service, description: nil)
      expect(service).to be_invalid
    end

    it 'does not create service without phone' do
      service = FactoryGirl.build(:service, phone: nil)
      expect(service).to be_invalid
    end

    it 'returns the social name if user has both social and civil name' do
      user = create(:user, social_name: 'social name', civil_name: 'civil name')
      service = build(:service, user: user)
      expect(service.owner).to eq('social name')
    end

    it 'returns the civil name if user has only civil name' do
      user = create(:user, social_name: nil, civil_name: 'civil name')
      service = build(:service, user: user)
      expect(service.owner).to eq('civil name')
    end

    it 'returns the social name if user has only social name' do
      user = create(:user, social_name: 'social name', civil_name: nil)
      service = build(:service, user: user)
      expect(service.owner).to eq('social name')
    end
  end
end
