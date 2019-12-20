require 'rails_helper'

RSpec.describe "countries/show", type: :view do
  before(:each) do
    @country = assign(:country, Country.create!(
      :name => "Name",
      :short_code => "Short Code",
      :phone_code => "Phone Code",
      :nickname => "Nickname"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Short Code/)
    expect(rendered).to match(/Phone Code/)
    expect(rendered).to match(/Nickname/)
  end
end
