require 'rails_helper'

RSpec.describe "campings/index", type: :view do
  before(:each) do
    assign(:campings, [
      Camping.create!(
        name: "Name",
        body: "MyText",
        country: nil,
        city: nil,
        region: nil
      ),
      Camping.create!(
        name: "Name",
        body: "MyText",
        country: nil,
        city: nil,
        region: nil
      )
    ])
  end

  it "renders a list of campings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
