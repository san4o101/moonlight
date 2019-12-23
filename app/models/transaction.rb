class Transaction < ApplicationRecord
  belongs_to :bill, foreign_key: 'sender_id'
  belongs_to :bill, foreign_key: 'recipient_id'
end
