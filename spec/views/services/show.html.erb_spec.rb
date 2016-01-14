require 'rails_helper'

RSpec.describe 'services/show', type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
                                  name: 'Name',
                                  description: 'MyText',
                                  phone: 'Phone',
                                  subarea_id: '1'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Subarea_id/)
  end
end
