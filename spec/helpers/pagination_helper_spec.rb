require 'rails_helper'

RSpec.describe PaginationHelper, type: :helper do
  it 'paginates 5 services per page' do
    records_per_page = 5
    page = 1
    (0..10).each do |i|
      create(:service, name: "service #{i}")
    end
    expected_services = paginate_services(Service.all, records_per_page, page)
    expect(expected_services.length).to eq(records_per_page)
  end
end
