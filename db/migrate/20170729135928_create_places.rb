class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :street_address
      t.string :zip_code
      t.string :country
      t.string :state
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
