class CreateManagerNotifications < ActiveRecord::Migration[5.2]
  def up
    create_table :manager_notifications do |t|
      t.bigint :admin_id
      t.bigint :bill_id
      t.string :message
    end
  end

  def down
    drop_table :manager_notifications
  end
end
