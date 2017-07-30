class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :street_address
      t.string :zip_code
      t.string :country
      t.string :state
      t.float :latitude
      t.float :longitude
      t.integer :user_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :places, :users
  end
end
