require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  describe 'GET #services_with_reports' do
    it 'renders the list of services with reports view' do
      get :services_with_reports
      expect(response).to render_template :services_with_reports
    end
    it 'should paginate by ten records per page' do
      number_records_per_page = 10
      (0..15).each do |i|
        service = create(:service, name: "service #{i}")
        create(:report, email: "emailtest#{i}@mail.com",  detail: "report #{i}", service: service)
      end
      get :services_with_reports
      expect(assigns(:services).to_a.length).to eq(number_records_per_page)
    end
  end
end

