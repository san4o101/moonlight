FactoryBot.define do
  factory :transaction do
    sender_id { "" }
    recipient_id { "" }
    amount { "9.99" }
    status { 1 }
  end
end
