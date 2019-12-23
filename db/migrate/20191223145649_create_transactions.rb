class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.bigint :sender_id
      t.bigint :recipient_id
      t.decimal :amount, precision: 10, scale: 2
      t.integer :status

      t.timestamps
    end
  end
end
