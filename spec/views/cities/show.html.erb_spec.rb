require 'rails_helper'

RSpec.describe 'admin/settings/cities/show', type: :view do
  before(:each) do
    @country = assign(:country, FactoryBot.create(:country))
    @city = assign(:city, FactoryBot.create(:city, country: @country))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Kiev/)
    expect(rendered).to match(/Ukraine/)
  end
end
