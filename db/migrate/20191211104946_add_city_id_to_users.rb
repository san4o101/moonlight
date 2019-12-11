class AddCityIdToUsers < ActiveRecord::Migration[5.2]
  def up
    change_table :users do |t|
      t.references :cities
    end
    User.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :users, :city_id
  end
end
