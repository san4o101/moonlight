class ManagerNotification < ApplicationRecord

  belongs_to :admin, class_name: :User, foreign_key: :admin_id
  belongs_to :bill, foreign_key: :bill_id

  enum status: { active: 1, viewed: 2 }

  scope :my_all, ->(admin_id) { where(admin_id: admin_id) }
  scope :my_active, ->(admin_id) { where(admin_id: admin_id, status: :active) }
  scope :my_viewed, ->(admin_id) { where(admin_id: admin_id, status: :viewed) }

end
