class BillsCreateJob < ApplicationJob
  queue_as :default
  include ApplicationHelper

  before_enqueue do |job|
    @service = BillsService.new
    user = job.arguments[0]
    type_bill = job.arguments[1]

    card_number = @service.generate_bill_number
    card_number = @service.generate_bill_number while Bill.find_by_card_number(card_number)

    bill = Bill.new(users_id: user.id, bill_type: type_bill,
                    card_number: card_number, amount: 0)
    throw(:abort) unless bill.valid?

    job.arguments[2] = card_number
  end

  def perform(user, type_bill, card_number = nil,
              auto_approved = BillRequest.approved_statuses[:auto])
    ActiveRecord::Base.transaction do
      bill = Bill.create(users_id: user.id, bill_type: type_bill, amount: 0,
                         percent: 0, card_number: card_number,
                         expired_bill_at: 5.year.from_now)
      if auto_approved == BillRequest.approved_statuses[:auto]
        BillRequestsService.new.create_approved_bill_request(user.id, bill.id)
        call_notification_job(bill, ManagerNotification.statuses[:viewed], I18n.t('bill_request.employee_registred'))
      else
        call_notification_job(bill, ManagerNotification.statuses[:active], I18n.t('bill_request.employee_create_bill'))
      end
    end
  end

  def call_notification_job(bill, status, message)
    ManagerNotificationJob.perform_later(random_admin, bill, status, message)
  end

end
