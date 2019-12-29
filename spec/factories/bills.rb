FactoryBot.define do

  factory :bill, class: 'Bill' do
    users_id { user.id }
    bill_type { 1 }
    amount { 100 }
    percent { 1 }
    close_at { '10.10.2024' }
    replenishment_at { '09.10.2019' }
    regular_replenishment_amount { 100 }
    expired_bill_at { '20.12.2024' }
    early_close_status { 1 }
    amount_limit { 5000 }
    card_number { '0000000000000000' }
    factory :new_number_bill, class: 'Bill' do
      card_number { '0000000000000001' }
    end
  end

end
