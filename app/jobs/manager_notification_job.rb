class ManagerNotificationJob < ApplicationJob
  queue_as :default

  def perform(admin, bill, status, message)
    ManagerNotification.create(admin_id: admin.id, bill_id: bill.id, message: message,
                               status: status)
  end
end
