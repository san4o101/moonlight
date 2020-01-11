FactoryBot.define do
  factory :bill_request do
    admin_id { user.id }
    bill_id { bill.id }
    approved_at { '2019-12-23 16:52:32' }
    approved_status { BillRequest.approved_statuses[:approved] }
    message { 'Test' }
  end
end
