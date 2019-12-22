class BillsCreateJob < ApplicationJob
  queue_as :default

  def perform(user)
    Bill.create!(users_id: user.id, bill_type: Bill::DEPOSIT_TYPE, amount: 0,
                 percent: 0)
  end
end
