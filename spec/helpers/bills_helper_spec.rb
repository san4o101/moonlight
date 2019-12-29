require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the BillsHelper. For example:
#
# describe BillsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BillsHelper, type: :helper do

  let(:user) { FactoryBot.create(:user) }
  let(:bill) { FactoryBot.create(:bill, user: user) }

  context 'test helpers' do
    it 'card expired date format' do
      expect(card_date_expired(bill.expired_bill_at)).to eq '12/2024'
    end
    it 'card number format' do
      expect(card_number_format(bill.card_number)).to eq '0000 0000 0000 0000'
    end
  end

end
