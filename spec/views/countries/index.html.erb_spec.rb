require 'rails_helper'

RSpec.describe "countries/index", type: :view do
  before(:each) do
    assign(:countries, [
      Country.create!(
        :name => "Name",
        :short_code => "Short Code",
        :phone_code => "Phone Code",
        :nickname => "Nickname"
      ),
      Country.create!(
        :name => "Name",
        :short_code => "Short Code",
        :phone_code => "Phone Code",
        :nickname => "Nickname"
      )
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
