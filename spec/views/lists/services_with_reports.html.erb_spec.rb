require 'rails_helper'

RSpec.describe 'lists/services_with_reports', type: :view do
  before :each do
    @records_per_page = 2
    service3 = create(:service, name: 'Service 3')
    create(:report, service: service3, email: 'email3@mail.com', detail: 'detail3')
    create(:report, service: service3, email: 'email32@mail.com', detail: 'detail3.2')
    service4 = create(:service, name: 'Service 4')
    create(:report, service: service4, email: 'email4@mail.com', detail: 'detail4')
    create(:service, name: 'Service 1', description: 'Desc 1', phone: 'Phone 1')
    create(:service, name: 'Service 2', description: 'Desc 2', phone: 'Phone 2')
  end

  it 'renders a list of services' do
    paginate
    render
    expect(rendered).to match(/Service 3/)
    expect(rendered).to match(/Service 4/)
  end

  it 'renders a paginated list of services' do
    create_services_with_reports(10)
    paginate
    render
    rendered.should match %r{href=\"\/list\/services_with_reports\?page=2\"}
  end

  it 'renders the number of reports by service' do
    service_with_report = create(:service, name: 'service with report')
    create(:report, email: 'example@gmail.com', service: service_with_report)
    create(:report, email: 'example2@gmail.com', service: service_with_report)
    paginate
    render
    assert_select 'div.denuncia' do
      assert_select 'span.reports', text: '2'
    end
  end

private

  def paginate
    services = Service.list_services_with_reports
    services = services.paginate(page: 1, per_page: @records_per_page)
    assign(:services, services)
  end

  def create_services_with_reports(total = 1)
    (0..total).each do |i|
      service = create(:service, name: "service #{i}")
      create(:report, email: "emailtest#{i}@mail.com", detail: "report #{i}", service: service)
    end
  end
end
