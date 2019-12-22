class BillsCreateJob < ApplicationJob
  queue_as :default

  def perform(user)
    card_number = generate_number
    card_number = generate_number while Bill.find_by_card_number(card_number)

    Bill.create!(users_id: user.id, bill_type: Bill::DEPOSIT_TYPE, amount: 0,
                 percent: 0, card_number: card_number,
                 expired_bill_at: 5.year.from_now)
  end

  def generate_number
    Array.new(4) { rand.to_s[2..5] }.join
  end
end
