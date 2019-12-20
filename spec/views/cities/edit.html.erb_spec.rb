require 'rails_helper'

RSpec.describe "cities/edit", type: :view do
  before(:each) do
    @city = assign(:city, City.create!(
      :name => "MyString",
      :country => nil
    ))
  end

  it "renders the edit city form" do
    render

    assert_select "form[action=?][method=?]", city_path(@city), "post" do

      assert_select "input[name=?]", "city[name]"

      assert_select "input[name=?]", "city[country_id]"
    end
  end
end
