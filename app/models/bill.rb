class Bill < ApplicationRecord
  belongs_to :user, foreign_key: 'users_id'
  has_many :transactions
  has_many :manager_notifications
  belongs_to :bill_request

  DEPOSIT_TYPE = 1
  CREDIT_TYPE = 2

  scope :my_bills, ->(users_id) { where(users_id: users_id) }

  def credit?
    bill_type == CREDIT_TYPE
  end

  def deposit?
    bill_type == DEPOSIT_TYPE
  end

end
