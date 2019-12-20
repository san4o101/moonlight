require 'rails_helper'

RSpec.describe "countries/index", type: :view do
  before(:each) do
    assign(:countries, [
        FactoryBot.create_list(:country, 2)
    ])
  end

  it "renders a list of countries" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short Code".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Code".to_s, :count => 2
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
  end
end
