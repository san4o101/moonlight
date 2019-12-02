class AddInfoToUsers < ActiveRecord::Migration[5.2]

  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :second_name, :string
    add_column :users, :role, :integer, default: User::USER_ROLE
    add_column :users, :birthday, :date
    add_column :users, :gender, :integer
    add_column :users, :status, :string, default: User::STATUS_DISABLE
    add_column :users, :phone, :integer

    User.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :users, :first_name, :last_name, :second_name, :role,
                   :birthday, :gender, :status, :phone
  end

end
