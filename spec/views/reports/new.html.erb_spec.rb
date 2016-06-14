require 'rails_helper'

RSpec.describe 'reports/new.html.erb', type: :view do
  before(:each) do
    assign(:report, build(:report))
  end

  it 'renders new report form' do
    render
    assert_select 'form[action=?][method=?]', '/reports/new', 'post' do
      assert_select 'input#report_email[name=?]', 'report[email]'
      assert_select 'input#report_detail[name=?]', 'report[detail]'
    end
  end
end
