require 'rails_helper'

RSpec.describe 'admin/settings/cities/index', type: :view do
  before(:each) do
    @country = assign(:country, FactoryBot.create(:country))
    @cities = assign(:cities, [FactoryBot.create(:city, country: @country),
                               FactoryBot.create(:city, country: @country)])
  end

  it 'renders a list of cities' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 1.to_s, count: 2
  end
end
