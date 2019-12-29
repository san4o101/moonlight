require 'rails_helper'

RSpec.describe 'admin/settings/cities/edit', type: :view do
  before(:each) do
    @country = assign(:country, FactoryBot.create(:country))
    @city = assign(:city, FactoryBot.create(:city, country: @country))
  end

  it 'renders the edit city form' do
    render

    assert_select 'form[action=?][method=?]', admin_settings_city_path(@city), 'post' do

      assert_select 'input[name=?]', 'city[name]'

      assert_select 'input[name=?]', 'city[country_id]'
    end
  end
end
