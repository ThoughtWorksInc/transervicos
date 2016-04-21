# coding: utf-8
require 'rails_helper'

RSpec.describe Service, type: :model do
  context 'with valid attributes'do
    it 'has one address' do
      service = create(:service)
      expect(service).to have_one(:address)
    end

    it 'properly saves address in user attributes' do
      service = create(:service)
      expect(service.address).not_to be_nil
    end
  end

  context 'with invalid attributes' do
    it 'does not create service without subarea' do
      service = build(:service_without_subarea)
      expect(service).to be_invalid
    end

    it 'does not create service without address' do
      service = build(:service_without_address)
      expect(service).to be_invalid
    end

    it 'does not create service without name' do
      service = build(:service, name: nil)
      expect(service).to be_invalid
    end

    it 'does not create service without description' do
      service = build(:service, description: nil)
      expect(service).to be_invalid
    end
  end

  context 'containing forbidden words on description' do
    it 'is invalid when description contains a forbidden word' do
      create(:forbidden_word, word: 'bad')
      service = build(:service, description: 'Contains bad word.')
      expect(service).to be_invalid
      expect(service.errors[:description].first).to include('bad.')
    end

    it 'is invalid when description contains several forbidden words' do
      %w(bad terrible horrible).each { |word| create(:forbidden_word, word: word) }
      service = build(:service, description: 'Contains bad word that is terrible, horrible.')
      expect(service).to be_invalid
      expect(service.errors[:description].first).to include('bad', 'terrible', 'horrible')
    end

    it 'is invalid when description contains a forbidden word in different case' do
      create(:forbidden_word, word: 'bad')
      service = build(:service, description: 'Contains BaD word.')
      expect(service).to be_invalid
    end

    it 'is invalid when description contains a forbidden word with accents' do
      create(:forbidden_word, word: 'óüç')
      service = build(:service, description: 'What is óüç?')
      expect(service).to be_invalid
    end

    it 'is valid when description contains a forbidden word as part of another word' do
      create(:forbidden_word, word: 'bad')
      service = build(:service, description: 'Dancing Lambada.')
      expect(service).to be_valid
    end
  end

  describe '#owner' do
    it 'is a sugar for User.preferred_name' do
      user = create(:user, civil_name: '', social_name: 'social name')
      service = build(:service, user: user)
      expect(user).to receive(:preferred_name)
      service.owner
    end
  end
end
