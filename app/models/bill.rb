class Bill < ApplicationRecord
  belongs_to :user, foreign_key: 'users_id'
  has_many :transactions, foreign_key: 'sender_id'
  has_many :transactions, foreign_key: 'recipient_id'
  has_many :manager_notifications
  has_one :bill_request

  DEPOSIT_TYPE = 1
  CREDIT_TYPE = 2

  scope :my_bills, ->(users_id) { where(users_id: users_id) }

  validates :card_number, length: { is: 16 }
  validates :bill_type, inclusion: { in: [DEPOSIT_TYPE, CREDIT_TYPE],
                                     message: 'Is not valid type' }

  def credit?
    bill_type == CREDIT_TYPE
  end

  def deposit?
    bill_type == DEPOSIT_TYPE
  end

end
