require 'rails_helper'

RSpec.describe "campings/show", type: :view do
  before(:each) do
    assign(:camping, Camping.create!(
      name: "Name",
      body: "MyText",
      country: nil,
      city: nil,
      region: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
