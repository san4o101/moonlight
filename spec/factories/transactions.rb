FactoryBot.define do
  factory :transaction do
    sender_id { sender.id }
    recipient_id { recipient.id }
    amount { 100 }
    status { 1 }
  end
end
