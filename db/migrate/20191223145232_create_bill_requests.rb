class CreateBillRequests < ActiveRecord::Migration[5.2]
  def up
    create_table :bill_requests do |t|
      t.bigint :admin_id
      t.bigint :bill_id
      t.datetime :approved_at
      t.integer :approved_status
      t.string :message
    end
  end

  def down
    drop_table :bill_requests
  end
end
