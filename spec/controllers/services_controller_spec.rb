require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  describe 'GET #index' do
  end

  describe 'GET #show' do
  end

  describe 'GET #new' do
    context 'when not logged in' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #edit' do
  end

  describe 'POST #create' do
    context 'when logged in' do
      let(:valid_service_attributes) do
        service_attributes = attributes_for(:service)
        service_attributes[:address_attributes] = attributes_for(:address)
        service_attributes[:subarea_attributes] = attributes_for(:subarea_education_college)
        service_attributes
      end
      before :each do
        sign_in
      end
      it 'creates a new service' do
        expect { post :create, service: valid_service_attributes }.to change { Service.count }.by(1)
      end
      it 'creates new address' do
        expect { post :create, service: valid_service_attributes }.to change { Address.count }.by(1)
      end
      it 'does not create a service without subarea' do
        expect do
          post :create,
               service: attributes_for(:service_without_subarea)
        end.to change { Address.count }.by(0)
      end
      it 'does not create a service without address' do
        expect do
          post :create,
               service: attributes_for(:service_without_address)
        end.to change { Address.count }.by(0)
      end
    end

    context 'when not logged in' do
      before :each do
        sign_in nil
      end
      it 'does not change service database' do
        expect { post :create, service: { area: 'ares' } }.not_to change { Service.count }
      end
      it 'does not change address database' do
        service_params = { service: { area: 'ares', address_attributes: { street: 'street' } } }
        expect { post :create, service_params }.not_to change { Address.count }
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
    end
    context 'with invalid params' do
    end
  end

  describe 'DELETE #destroy' do
  end
end
