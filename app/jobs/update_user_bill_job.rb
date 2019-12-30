class UpdateUserBillJob < ApplicationJob
  queue_as :default

  # make message
  before_enqueue do |job|
    bill = job.arguments[0]
    admin = job.arguments[1]

    message = I18n.t('mails.update_bill.message', card: bill.card_number,
                                                  admin: admin.full_name)

    job.arguments[2] = message
  end

  def perform(bill, _admin, message = nil)
    user = bill.user
    UpdateUserBillMailer.submission(message, user.email).deliver
  end
end
