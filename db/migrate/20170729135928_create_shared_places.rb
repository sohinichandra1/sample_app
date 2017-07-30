class CreateSharedPlaces < ActiveRecord::Migration
  def change
    create_table :shared_places do |t|
      t.string :street_address, null: false
      t.string :zip_code
      t.string :country, null: false
      t.string :state,  null: false
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
