require 'rails_helper'

RSpec.describe 'admin/settings/countries/index', type: :view do
  before(:each) do
    assign(:countries, FactoryBot.create_list(:country, 2))
  end

  it 'renders a list of countries' do
    render
    assert_select 'tr>td', text: 'Ukraine'.to_s, count: 2
    assert_select 'tr>td', text: 'UA'.to_s, count: 2
    assert_select 'tr>td', text: '380'.to_s, count: 2
    assert_select 'tr>td', text: 'UKRAINE'.to_s, count: 2
  end
end
