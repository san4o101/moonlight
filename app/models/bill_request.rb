class BillRequest < ApplicationRecord
  belongs_to :user, foreign_key: 'admin_id'
  belongs_to :bill, foreign_key: 'bill_id'

  APPROVED_AUTO = 0
  APPROVED_YES = 1
  APPROVED_NO = 2

  def approved?
    approved_status == APPROVED_YES
  end

end
