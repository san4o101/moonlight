class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :short_code
      t.string :phone_code
      t.string :nickname

      t.timestamps
    end
  end
end
