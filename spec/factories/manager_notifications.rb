FactoryBot.define do
  factory :manager_notification do
    admin_id { user.id }
    bill_id { bill.id }
    message { 'Test message' }
  end
end
