FactoryBot.define do
  factory :manager_notification do
    admin_id { FactoryBot.create(:admin).id }
    bill_id { bill.id }
    message { 'Test message' }
    status { ManagerNotification::ACTIVE_STATUS }
  end
end
