require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  describe 'GET #index' do
  end

  describe 'GET #show' do
    let(:service) { create(:service) }
    before :each do
      get :show, id: service.id
    end
    it { expect(response).to render_template :show }
    it { expect(assigns(:service).name).to eq(service.name) }
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
    context 'when used is not logged in' do
      let(:service) { create(:service) }

      it 'redirects to sign in page' do
        get :edit, id: service.id

        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'when user is logged in and user is updating his own service' do
      let(:service) { create(:service, user_id: @user.id) }

      before :each do
        @user = create(:user)
        sign_in @user
        get :edit, id: service.id
      end

      it { expect(response).to render_template :edit }
      it { expect(assigns(:service).name).to eq(service.name) }
    end
  end

  describe 'POST #create' do
    context 'when logged in' do
      let(:valid_service_attributes) do
        service_attributes = attributes_for(:service)
        service_attributes[:subarea_id] = create(:subarea_education_college).id
        service_attributes[:address_attributes] = attributes_for(:address)
        service_attributes
      end
      before :each do
        sign_in FactoryGirl.create(:user)
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
    context 'when user is logged in and is updating his own service' do
      let(:service) { create(:service, user_id: @user.id) }

      before :each do
        @user = create(:user)
        sign_in @user
        get :edit, id: service.id
      end

      it 'updates the name attribute' do
        put :update, id: service.id, service: { name: 'other name' }
        expect(assigns(:service).name).to eq('other name')
      end
      it 'updates the description attribute' do
        put :update, id: service.id, service: { description: 'other description' }
        expect(assigns(:service).description).to eq('other description')
      end
      it 'updates the phone attribute' do
        put :update, id: service.id, service: { phone: 'other phone' }
        expect(assigns(:service).phone).to eq('other phone')
      end

      it 'updates the address attribute' do
        put :update, id: service.id, service: { address_attributes: {
          street: 'other street'
        } }
        expect(assigns(:service).address.street).to eq('other street')
      end
    end
  end

  describe 'DELETE #destroy' do
  end
end
