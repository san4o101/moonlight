class Bill < ApplicationRecord
  has_one :user

  DEPOSIT_TYPE = 1
  CREDIT_TYPE = 2

end
