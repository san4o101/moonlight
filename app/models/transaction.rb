class Transaction < ApplicationRecord
  belongs_to :bill, foreign_key: :sender_id
  belongs_to :bill, foreign_key: :recipient_id

  paginates_per 15

  STATUS_I_REPLENISHMENT = 1

  scope :order_by_date, -> { order('created_at DESC') }

  def i_replenishment?
    status == STATUS_I_REPLENISHMENT
  end
end
