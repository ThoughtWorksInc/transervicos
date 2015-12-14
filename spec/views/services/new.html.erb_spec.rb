require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      :area => "MyString",
      :subarea => "MyString",
      :name => "MyString",
      :description => "MyText",
      :phone => "MyString"
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_area[name=?]", "service[area]"

      assert_select "input#service_subarea[name=?]", "service[subarea]"

      assert_select "input#service_name[name=?]", "service[name]"

      assert_select "textarea#service_description[name=?]", "service[description]"

      assert_select "input#service_phone[name=?]", "service[phone]"
    end
  end
end
