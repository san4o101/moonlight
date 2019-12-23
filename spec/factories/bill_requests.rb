FactoryBot.define do
  factory :bill_request do
    admin_id { "" }
    bill_id { "" }
    approved_at { "2019-12-23 16:52:32" }
    approved_status { 1 }
    message { "MyString" }
  end
end
