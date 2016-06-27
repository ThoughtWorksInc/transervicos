require 'rails_helper'

RSpec.describe 'reports/index', type: :view do
  before :each do
    service = build(:service, name: 'Service 1', description: 'Desc 1')
    reports = [
      build(:report, email: 'email1@com', detail: 'Detail 1'),
      build(:report, email: 'email2@com', detail: 'Detail 2')
    ]
    assign(:service, service)
    assign(:reports, reports)
    render
  end

  it 'renders a service' do
    expect(rendered).to match(/Service 1/)
    expect(rendered).to match(/Desc 1/)
  end

  it 'renders a list of reports' do
    expect(rendered).to match(/email1@com/)
    expect(rendered).to match(/email2@com/)
    expect(rendered).to match(/Detail 1/)
    expect(rendered).to match(/Detail 2/)
  end
end
