require 'rails_helper'

RSpec.describe "campings/edit", type: :view do
  let(:camping) {
    Camping.create!(
      name: "MyString",
      body: "MyText",
      country: nil,
      city: nil,
      region: nil
    )
  }

  before(:each) do
    assign(:camping, camping)
  end

  it "renders the edit camping form" do
    render

    assert_select "form[action=?][method=?]", camping_path(camping), "post" do

      assert_select "input[name=?]", "camping[name]"

      assert_select "textarea[name=?]", "camping[body]"

      assert_select "input[name=?]", "camping[country_id]"

      assert_select "input[name=?]", "camping[city_id]"

      assert_select "input[name=?]", "camping[region_id]"
    end
  end
end
