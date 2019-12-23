class ManagerNotification < ApplicationRecord
  belongs_to :user, foreign_key: 'admin_id'
  belongs_to :bill, foreign_key: 'bill_id'
end
