require 'rails_helper'

RSpec.describe BillRequest, type: :model do

  let(:user) { FactoryBot.create(:user) }
  let(:bill) { FactoryBot.create(:bill, user: user) }
  let(:bill_request) { FactoryBot.create(:bill_request, user: user, bill: bill) }

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:bill) }
  end

  context '#check_validation' do

    it 'is valid with all attributes' do
      expect(bill_request).to be_valid
    end

    it 'is not valid without a admin' do
      test_request = BillRequest.new(admin_id: nil)
      expect(test_request).to_not be_valid
    end

    it 'is not valid without a bill' do
      test_request = BillRequest.new(bill_id: nil)
      expect(test_request).to_not be_valid
    end

    it 'is approved bill request' do
      expect(bill_request.approved?).to be true
    end

  end

end
