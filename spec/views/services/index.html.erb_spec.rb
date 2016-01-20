require 'rails_helper'

RSpec.describe 'services/index', type: :view do
  before(:each) do
    assign(:services, [
      create(:service, name: 'Service 1', description: 'Desc 1', phone: 'Phone 1'),
      create(:service, name: 'Service 2', description: 'Desc 2', phone: 'Phone 2')])
  end

  it 'renders a list of services' do
    render
    expect(rendered).to match(/Service 1/)
    expect(rendered).to match(/Service 2/)
    expect(rendered).to match(/Desc 1/)
    expect(rendered).to match(/Desc 2/)
    expect(rendered).to match(/Phone 1/)
    expect(rendered).to match(/Phone 2/)
  end
end
