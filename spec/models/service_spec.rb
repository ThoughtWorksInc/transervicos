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

  context 'filter forbidden words' do
    it 'is invalid when description contains a forbidden word' do
      create(:forbidden_word, word: 'bad')
      service = build(:service, description: 'Contains bad word.')
      expect(service).to be_invalid
      expect(service.errors[:description].first).to include('bad.')
    end

    it 'is invalid when name contains a forbidden word' do
      create(:forbidden_word, word: 'bad')
      service = build(:service, name: 'Bad service')
      expect(service).to be_invalid
      expect(service.errors[:name].first).to include('bad.')
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

  describe '#website' do
    it 'is valid when the website has a valid format' do
      service = build(:service, website: 'www.meusite.com.br')
      expect(service).to be_valid
    end

    it 'is invalid when the website has an invalid format' do
      service = build(:service, website: 'invalid_format')
      expect(service).to be_invalid
    end

    it 'should add url protocol before saving' do
      url = 'website.com'
      service = create(:service, website: url)
      expect(service.website).to eq("http://#{url}")
    end

    it 'should return same website with https protocol' do
      url = 'https://website.com'
      service = create(:service, website: url)
      expect(service.website).to eq(url)
    end
  end

  describe '#default scope' do
    it 'orders by ascending name' do
      service1 = 'Service 1'
      service2 = 'Service 2'
      service3 = 'Service 3'
      create(:service, name: service3)
      create(:service, name: service1)
      create(:service, name: service2)

      services = Service.all
      obtained_services_names = services.to_a.map(&:name)

      expect(obtained_services_names).to eq([service1, service2, service3])
    end
  end

  describe '#text_search' do
    it 'returns a service when the text matches with the name' do
      service1 = create(:service, name: 'service 1')
      expect(Service.text_search('service 1')).to eq([service1])
    end

    it 'returns a service when the text matches with the description' do
      service1 = create(:service, description: 'description 1')
      expect(Service.text_search('DESCRIPTION')).to eq([service1])
    end

    it 'returns a service when the text matches with the description with special characters' do
      service1 = create(:service, description: 'Orientação')
      expect(Service.text_search('Orientacao')).to eq([service1])
    end
  end

  describe '#state_search' do
    it 'returns a service when the text matches with the state' do
      state = create(:state)
      address = create(:address, state: state)
      service = create(:service, address: address)
      expect(Service.state_search(state.id)).to eq([service])
    end
  end

  describe '#city_search' do
    it 'returns a service when the text matches with the state' do
      city = create(:city)
      address = create(:address, city: city)
      service = create(:service, address: address)
      expect(Service.city_search(city.id)).to eq([service])
    end
  end
  describe '#report_search_by_service' do
    it 'it returns services if the service has at least one report' do
      create(:service, name: 'service without report')
      service_with_report = create(:service, name: 'service with report')
      create(:report, email: 'example@gmail.com', service: service_with_report)
      expect(Service.list_services_with_reports.first).to eq(service_with_report)
    end
    it 'should return distinct services if the services have multiples reports' do
      expected_number_services = 1
      create(:service, name: 'service without report')
      service_with_report = create(:service, name: 'service with report')
      create(:report, email: 'example@gmail.com', service: service_with_report)
      create(:report, email: 'example2@gmail.com', service: service_with_report)
      expect(Service.list_services_with_reports.length).to eq(expected_number_services)
    end
  end
  describe '#calculate reports count' do
    it 'should return the number of reports by service' do
      expected_number_reports = 2
      service_with_report = create(:service, name: 'service with report')
      create(:report, email: 'example@gmail.com', service: service_with_report)
      create(:report, email: 'example2@gmail.com', service: service_with_report)
      expect(service_with_report.reports_count).to eq(expected_number_reports)
    end
  end
end
