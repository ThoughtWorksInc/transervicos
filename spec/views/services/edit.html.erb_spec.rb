require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :name => "MyString",
      :description => "MyText",
      :phone => "MyString"
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

    assert_select "input#service_name[name=?]", "service[name]"

    assert_select "textarea#service_description[name=?]", "service[description]"

    assert_select "input#service_phone[name=?]", "service[phone]"
    end
  end
end
