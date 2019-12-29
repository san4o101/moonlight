require 'rails_helper'

RSpec.describe 'admin/settings/countries/show', type: :view do
  before(:each) do
    @country = assign(:country, FactoryBot.create(:country))
  end

  it 'renders attributes in' do
    render
    expect(rendered).to match(/Ukraine/)
    expect(rendered).to match(/UA/)
    expect(rendered).to match(/380/)
    expect(rendered).to match(/UKRAINE/)
  end
end
