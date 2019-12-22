class AddCardNumberToBills < ActiveRecord::Migration[5.2]
  def up
    add_column :bills, :card_number, :string
    add_index :bills, :card_number, unique: true
  end

  def down
    remove_column :bills, :card_number
  end
end
