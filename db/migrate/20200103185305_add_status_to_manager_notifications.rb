class AddStatusToManagerNotifications < ActiveRecord::Migration[5.2]
  def up
    add_column :manager_notifications, :status, :integer, default: ManagerNotification::ACTIVE_STATUS
  end

  def down
    remove_column :manager_notifications, :status
  end
end
