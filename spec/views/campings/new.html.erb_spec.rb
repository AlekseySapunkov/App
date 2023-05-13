require 'rails_helper'

RSpec.describe "campings/new", type: :view do
  before(:each) do
    assign(:camping, Camping.new(
      name: "MyString",
      body: "MyText",
      country: nil,
      city: nil,
      region: nil
    ))
  end

  it "renders new camping form" do
    render

    assert_select "form[action=?][method=?]", campings_path, "post" do

      assert_select "input[name=?]", "camping[name]"

      assert_select "textarea[name=?]", "camping[body]"

      assert_select "input[name=?]", "camping[country_id]"

      assert_select "input[name=?]", "camping[city_id]"

      assert_select "input[name=?]", "camping[region_id]"
    end
  end
end
