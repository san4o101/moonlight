require 'rails_helper'

RSpec.describe 'employee/bills/index', type: :view do
  before(:each) do
    @user = assign(:user, FactoryBot.create(:user))
    assign(:bills, [FactoryBot.create(:bill, user: @user),
                    FactoryBot.create(:new_number_bill, user: @user)])
  end

  it 'renders a list of bills' do
    render
  end
end
