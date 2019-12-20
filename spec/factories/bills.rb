FactoryBot.define do

  factory :bill, class: 'Bill' do
    users_id { 1 }
    bill_type { 1 }
    amount { 100 }
    percent { 1 }
    close_at { '10.10.2019' }
    replenishment_at { '09.10.2019' }
    regular_replenishment_amount { 100 }
    expired_bill_at { '20.12.2019' }
    early_close_status { 1 }
    amount_limit { 5000 }
  end

end
