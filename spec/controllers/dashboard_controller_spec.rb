require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET #index' do
    context 'when logged in' do
      it 'returns http success' do
        sign_in FactoryGirl.create(:user)
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'when not logged in' do
      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
