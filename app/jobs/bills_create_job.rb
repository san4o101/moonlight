class BillsCreateJob < ApplicationJob
  queue_as :default

  # TODO: after job create new bill send message to admin
  #after_enqueue do |job|
  #  ManagerNotificationJob.perform_later(job.arguments)
  #end

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

  def perform(user, type_bill, card_number = nil,
              auto_approved = BillRequest::APPROVED_AUTO)
    ActiveRecord::Base.transaction do
      bill = Bill.create(users_id: user.id, bill_type: type_bill, amount: 0,
                         percent: 0, card_number: card_number,
                         expired_bill_at: 5.year.from_now)
      if auto_approved == BillRequest::APPROVED_AUTO
        create_bill_request(user.id, bill.id)
      end
    end
  end

  def generate_number
    Array.new(4) { rand.to_s[2..5] }.join
  end

  def create_bill_request(user_id, bill_id)
    BillRequest.create(admin_id: user_id, bill_id: bill_id,
                       approved_at: DateTime.now,
                       message: I18n.t('bill_request.auto_approved'),
                       approved_status: BillRequest::APPROVED_YES)
  end

end
