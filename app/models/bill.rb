class Bill < ApplicationRecord
  belongs_to :user, foreign_key: :users_id
  has_many :transactions, lambda { |bill|
    unscope(:where)
      .where('sender_id = :id OR recipient_id = :id',
             id: bill.id)
  }
  has_many :sender, class_name: :Transaction, foreign_key: :sender_id
  has_many :recipient, class_name: :Transaction, foreign_key: :recipient_id
  has_many :manager_notifications
  has_one :bill_request

  enum bill_type: { deposit: 1, credit: 2 }

  scope :my_bills, lambda { |users_id|
    joins(:bill_request)
      .where('bills.users_id = ? AND bill_requests.approved_status = ?',
             users_id, BillRequest.approved_statuses[:approved])
  }
  scope :order_by_id, -> { order('id ASC') }

  validates :card_number, length: { is: 16 }
  validates :amount, numericality: true,
                     format: { with: /\A\d{1,6}\.\d{1,2}/,
                               message: I18n.t('validation.amountError') }

  def i_send?(sender_id)
    id == sender_id
  end

  def enough_amount?(send_amount)
    amount < send_amount
  end

  def expired?
    expired_bill_at < Date.today
  end

  def full_info?
    amount_limit.present? && regular_replenishment_amount.present? && percent != 0
  end

end
