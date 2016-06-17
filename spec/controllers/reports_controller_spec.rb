require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'GET #new' do
    it 'renders the report view' do
      get :new, service_id: Random.rand
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it 'creates a new report' do
      service = create(:service)
      report = attributes_for(:report)
      report[:service_id] = service.id
      expect { post :create, report: report }.to change { Report.count }.by(1)
    end
  end
end
