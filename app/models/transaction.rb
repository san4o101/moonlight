class Transaction < ApplicationRecord
  belongs_to :sender, class_name: :Bill, foreign_key: :sender_id
  belongs_to :recipient, class_name: :Bill, foreign_key: :recipient_id

  paginates_per 15

  enum status: { i_replenishment: 1, transfer: 2 }

  scope :order_by_date, -> { order('created_at DESC') }

end
