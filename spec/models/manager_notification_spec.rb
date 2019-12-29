require 'rails_helper'

RSpec.describe ManagerNotification, type: :model do

  let(:user) { FactoryBot.create(:user) }
  let(:bill) { FactoryBot.create(:bill, user: user) }
  let(:notification) do
    FactoryBot.create(:manager_notification, user: user, bill: bill)
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:bill) }
  end

  context '#check_validation' do
    it 'is valid with all attributes' do
      expect(notification).to be_valid
    end
    it 'is not valid admin' do
      test = ManagerNotification.new(admin_id: nil)
      expect(test).to_not be_valid
    end
    it 'is not valid bill' do
      test = ManagerNotification.new(bill_id: nil)
      expect(test).to_not be_valid
    end
  end

end
