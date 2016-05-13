require 'rails_helper'

RSpec.describe 'services/index', type: :view do
  before :each do
    @records_per_page = 5
    create(:service, name: 'Service 1', description: 'Desc 1', phone: 'Phone 1')
    create(:service, name: 'Service 2', description: 'Desc 2', phone: 'Phone 2')
  end

  it 'renders a list of services' do
    services = paginate

    render

    expect(rendered).to match(/Service 1/)
    expect(rendered).to match(/Service 2/)
    expect(rendered).to match(/Desc 1/)
    expect(rendered).to match(/Desc 2/)
    expect(rendered).to match(/Phone 1/)
    expect(rendered).to match(/Phone 2/)
  end

  it 'renders a paginated list of services' do
    create(:service, name: 'Service 3', description: 'Desc 3', phone: 'Phone 3')
    create(:service, name: 'Service 4', description: 'Desc 4', phone: 'Phone 4')
    create(:service, name: 'Service 5', description: 'Desc 5', phone: 'Phone 5')
    create(:service, name: 'Service 6', description: 'Desc 6', phone: 'Phone 6')
    services = paginate

    render
    rendered.should match(/href=\"\/servicos\?page=2\"/)
  end

private
  def paginate
    services = Service.all
    services = services.paginate(:page => 1, :per_page => @records_per_page)
    assign(:services, services)
  end
end
