require 'rails_helper'

RSpec.describe Transaction, type: :model do

  let(:user) { FactoryBot.create(:user) }
  let(:sender) { FactoryBot.create(:bill, user: user) }
  let(:recipient) { FactoryBot.create(:new_number_bill, user: user) }
  let(:transaction) { FactoryBot.create(:transaction, sender_id: sender.id, recipient_id: recipient.id) }

  context 'associations' do
    it { should belong_to(:bill) }
  end

  context '#check_validation' do
    it 'is valid with all attributes' do
      expect(transaction).to be_valid
    end
    it 'is i replenishment transactions' do
      expect(transaction.i_replenishment?).to be true
    end
  end

end
