class Transaction < ApplicationRecord
  belongs_to :sender, class_name: :Bill, foreign_key: :sender_id
  belongs_to :recipient, class_name: :Bill, foreign_key: :recipient_id

  paginates_per 15

  STATUS_I_REPLENISHMENT = 1
  STATUS_TRANSFER = 2

  scope :order_by_date, -> { order('created_at DESC') }

  def i_replenishment?
    status == STATUS_I_REPLENISHMENT
  end

  def transfer?
    status == STATUS_TRANSFER
  end
end
