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
end
