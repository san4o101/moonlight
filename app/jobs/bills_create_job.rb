class BillsCreateJob < ApplicationJob
  queue_as :default

  before_enqueue do |job|
    user = job.arguments[0]
    type_bill = job.arguments[1]

    card_number = generate_number
    card_number = generate_number while Bill.find_by_card_number(card_number)

    bill = Bill.new(users_id: user.id, bill_type: type_bill,
                    card_number: card_number)
    throw(:abort) unless bill.valid?

    job.arguments[2] = card_number
  end

  def perform(user, type_bill, card_number = nil)
    Bill.create(users_id: user.id, bill_type: type_bill, amount: 0,
                percent: 0, card_number: card_number,
                expired_bill_at: 5.year.from_now)
  end

  def generate_number
    Array.new(4) { rand.to_s[2..5] }.join
  end
end
