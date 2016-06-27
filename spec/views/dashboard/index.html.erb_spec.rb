require 'rails_helper'

RSpec.describe 'dashboard/index', type: :view do
  before :each do
    sign_in FactoryGirl.create(:user)
    assign(:services, [])
  end
  it 'renders a paginated list of services' do
    render
    rendered.should match %r{href=\"\/list\/services_with_reports\"}
  end
end
