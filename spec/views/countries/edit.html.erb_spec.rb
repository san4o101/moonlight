require 'rails_helper'

RSpec.describe 'admin/settings/countries/edit', type: :view do
  before(:each) do
    @country = assign(:country, FactoryBot.create(:country))
  end

  it 'renders the edit country form' do
    render

    assert_select 'form[action=?][method=?]', admin_settings_country_path(@country), 'post' do

      assert_select 'input[name=?]', 'country[name]'

      assert_select 'input[name=?]', 'country[short_code]'

      assert_select 'input[name=?]', 'country[phone_code]'

      assert_select 'input[name=?]', 'country[nickname]'
    end
  end
end
