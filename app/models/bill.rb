class Bill < ApplicationRecord
  belongs_to :user, foreign_key: 'users_id'

  DEPOSIT_TYPE = 1
  CREDIT_TYPE = 2

  scope :my_bills, ->(users_id) { where(users_id: users_id) }

end
