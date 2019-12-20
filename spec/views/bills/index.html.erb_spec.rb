require 'rails_helper'

RSpec.describe "bills/index", type: :view do
  before(:each) do
    assign(:bills, [
        FactoryBot.create_list(:bill, 2)
    ])
  end

  it "renders a list of bills" do
    render
  end
end
