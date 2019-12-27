class BillRequest < ApplicationRecord
  belongs_to :user, foreign_key: 'admin_id'
  belongs_to :bill, foreign_key: 'bill_id'

  APPROVED_YES = 1
  APPROVED_NO = 2

end
