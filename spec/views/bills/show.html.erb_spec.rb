require 'rails_helper'

RSpec.describe "bills/show", type: :view do
  before(:each) do
    @bill = assign(:bill, FactoryBot.create(:bill))
  end

  it "renders attributes in <p>" do
    render
  end
end
