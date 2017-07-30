class CreateSharedPlaces < ActiveRecord::Migration
  def change
    create_table :shared_places do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :place_id
      t.boolean :public, default: false

      t.timestamps null: false
    end

    add_foreign_key :shared_places, :users
    add_foreign_key :shared_places, :places
  end
end
