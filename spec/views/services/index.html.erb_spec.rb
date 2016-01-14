require 'rails_helper'

RSpec.describe 'services/index', type: :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        name: 'Name',
        description: 'MyText',
        phone: 'Phone'
      ),
      Service.create!(
        name: 'Name',
        description: 'MyText',
        phone: 'Phone'
      )
    ])
  end

  it 'renders a list of services' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Phone'.to_s, count: 2
  end
end
