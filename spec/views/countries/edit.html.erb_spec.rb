require 'rails_helper'

RSpec.describe "countries/edit", type: :view do
  before(:each) do
    @country = assign(:country, Country.create!(
      :name => "MyString",
      :short_code => "MyString",
      :phone_code => "MyString",
      :nickname => "MyString"
    ))
  end

  it "renders the edit country form" do
    render

    assert_select "form[action=?][method=?]", country_path(@country), "post" do

      assert_select "input[name=?]", "country[name]"

      assert_select "input[name=?]", "country[short_code]"

      assert_select "input[name=?]", "country[phone_code]"

      assert_select "input[name=?]", "country[nickname]"
    end
  end
end
