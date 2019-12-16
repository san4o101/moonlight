class CreateBills < ActiveRecord::Migration[5.2]
  def up
    create_table :bills do |t|
      t.references :users, foreign_key: true
      t.integer :bill_type
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :percent
      t.timestamps
      t.datetime :close_at
      t.datetime :replenishment_at
      t.decimal :regular_replenishment_amount
      t.date :expired_bill_at
      t.integer :early_close_status
      t.decimal :amount_limit, precision: 10, scale: 2
    end
  end

  def down

  end
end
