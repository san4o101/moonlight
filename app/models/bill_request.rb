class BillRequest < ApplicationRecord
  belongs_to :user, foreign_key: :admin_id
  belongs_to :bill, foreign_key: :bill_id

  enum approved_status: { auto: 0, approved: 1, not_approved: 2 }

end
