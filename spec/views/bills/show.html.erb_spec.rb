require 'rails_helper'

RSpec.describe 'employee/bills/show', type: :view do
  before(:each) do
    @user = assign(:user, FactoryBot.create(:user))
    @bill = assign(:bill, FactoryBot.create(:bill, user: @user))
    @recipient = assign(:recipient, FactoryBot.create(:new_number_bill, user: @user))
    @transactions = assign(:transactions, FactoryBot.create(:transaction, sender_id: @bill.id, recipient_id: @recipient.id))
  end

  it 'renders attributes' do
    render
  end
end
