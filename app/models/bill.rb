class Bill < ApplicationRecord
  belongs_to :user, foreign_key: :users_id
  has_many :transactions, foreign_key: :sender_id
  has_many :transactions, foreign_key: :recipient_id
  has_many :manager_notifications
  has_one :bill_request

  DEPOSIT_TYPE = 1
  CREDIT_TYPE = 2

  scope :my_bills, lambda { |users_id|
    joins(:bill_request)
      .where('bills.users_id = ? AND bill_requests.approved_status = ?',
             users_id, BillRequest::APPROVED_YES)
  }
  scope :order_by_id, -> { order('id ASC') }

  validates :card_number, length: { is: 16 }
  validates :bill_type, inclusion: { in: [DEPOSIT_TYPE, CREDIT_TYPE],
                                     message: I18n.t('validation.billTypeError') }
  validates :amount, numericality: true,
                     format: { with: /\A\d{1,6}\.\d{1,2}/,
                               message: I18n.t('validation.amountError') }

  def credit?
    bill_type == CREDIT_TYPE
  end

  def deposit?
    bill_type == DEPOSIT_TYPE
  end

end
