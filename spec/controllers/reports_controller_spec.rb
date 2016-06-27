require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new report' do
      service = create(:service)
      report = attributes_for(:report)
      report[:service_id] = service.id
      expect { post :create, service_id: service.id, report: report }.to change { Report.count }.by(1)
      response.should redirect_to :services
    end
  end

  describe 'GET #reports' do
    it 'find reports by service id' do
      allow_any_instance_of(ReportsController).to receive(:authenticate_user!).and_return(true)
      service = create(:service)
      reports = [
        create(:report, service_id: service.id),
        create(:report, service_id: service.id)
      ]
      get :find_reports_by_service, service_id: service.id
      expect(assigns(:service)).to eq(service)
      expect(assigns(:reports)).to eq(reports)
    end
  end
end
