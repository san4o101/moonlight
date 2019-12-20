require 'rails_helper'

RSpec.describe "countries/new", type: :view do
  before(:each) do
    assign(:country, FactoryBot.create(:country))
  end

  it "renders new country form" do
    render

    assert_select "form[action=?][method=?]", admin_settings_countries_path, "post" do

      assert_select "input[name=?]", "country[name]"

      assert_select "input[name=?]", "country[short_code]"

      assert_select "input[name=?]", "country[phone_code]"

      assert_select "input[name=?]", "country[nickname]"
    end
  end
end
