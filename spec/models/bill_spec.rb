require 'rails_helper'

RSpec.describe Bill, type: :model do

  let(:user) { FactoryBot.create(:user) }
  let(:bill) { FactoryBot.create(:bill, user: user) }

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:sender) }
    it { should have_many(:recipient) }
    it { should have_many(:manager_notifications) }
    it { should have_one(:bill_request) }
  end


  context '#check_validation' do
    it 'is valid with all attributes' do
      expect(bill).to be_valid
    end
    it 'is not valid card number' do
      test = Bill.new(card_number: nil)
      expect(test).to_not be_valid
    end
    it 'is short \ long card number' do
      test = Bill.new(card_number: '0000000')
      expect(test).to_not be_valid
      test.card_number = '0000000000000000000000000'
      expect(test).to_not be_valid
    end
    it 'is not valid bill type' do
      test = Bill.new(bill_type: nil)
      expect(test).to_not be_valid
    end
    it 'is not valid amount' do
      test = Bill.new(amount: nil)
      expect(test).to_not be_valid
      test.amount = 10_000_000_000_000_000
      expect(test).to_not be_valid
    end
    it 'is credit bill' do
      test = Bill.new(bill_type: Bill.bill_types[:credit])
      expect(test.bill_type).to eq Bill.bill_types.key(Bill.bill_types[:credit])
    end
    it 'is deposit bill' do
      test = Bill.new(bill_type: Bill.bill_types[:deposit])
      expect(test.bill_type).to eq Bill.bill_types.key(Bill.bill_types[:deposit])
    end
  end

end
