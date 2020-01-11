class AddStatusToManagerNotifications < ActiveRecord::Migration[5.2]
  def up
    add_column :manager_notifications, :status, :integer, default: ManagerNotification.statuses[:active]
  end

  def down
    remove_column :manager_notifications, :status
  end
end
