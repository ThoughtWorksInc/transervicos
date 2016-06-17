require 'rails_helper'

RSpec.describe 'reports/new.html.erb', type: :view do
  it 'renders new report form' do
    render
    assert_select 'form[action=?][method=?]', report_path, 'post' do
      assert_select 'input[type=hidden]#report_service_id[name=?]', 'report[service_id]'
      assert_select 'input#report_email[name=?]', 'report[email]'
      assert_select 'input#report_detail[name=?]', 'report[detail]'
      assert_select 'input[type=submit]'
    end
  end
end
