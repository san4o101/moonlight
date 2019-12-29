require 'rails_helper'

RSpec.describe 'admin/settings/cities/new', type: :view do
  before(:each) do
    assign(:city, City.new)
  end

  it 'renders new city form' do
    render

    assert_select 'form[action=?][method=?]', admin_settings_cities_path, 'post' do

      assert_select 'input[name=?]', 'city[name]'

      assert_select 'input[name=?]', 'city[country_id]'
    end
  end
end
