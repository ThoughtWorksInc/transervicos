# require 'rails_helper'
#
# RSpec.describe 'services/index', type: :view do
#   before(:each) do
#     assign(:services, [
#       create(:service, name: 'Service', description: 'Desc', phone: 'Phone'),
#       create(:service, name: 'Service', description: 'Desc', phone: 'Phone')])
#   end
#
#   it 'renders a list of services' do
#     render
#     assert_select 'tr>td', text: 'Service'.to_s, count: 2
#     assert_select 'tr>td', text: 'Desc'.to_s, count: 2
#     assert_select 'tr>td', text: 'Phone'.to_s, count: 2
#   end
# end
