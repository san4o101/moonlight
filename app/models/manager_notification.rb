class ManagerNotification < ApplicationRecord

  belongs_to :admin, class_name: :User, foreign_key: :admin_id
  belongs_to :bill, foreign_key: :bill_id

  ACTIVE_STATUS = 1
  VIEWED_STATUS = 2

  scope :my_all, ->(admin_id) { where(admin_id: admin_id) }
  scope :my_active, ->(admin_id) { where(admin_id: admin_id, status: ACTIVE_STATUS) }
  scope :my_viewed, ->(admin_id) { where(admin_id: admin_id, status: VIEWED_STATUS) }

end
