class CreateUserSharedPlaces < ActiveRecord::Migration
  def change
    create_table :user_shared_places do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :shared_place_id
      t.boolean :public, default: false

      t.timestamps null: false
    end

    add_foreign_key :user_shared_places, :users
    add_foreign_key :user_shared_places, :shared_places
    add_index :user_shared_places, [:user_id, :shared_place_id, :friend_id], unique: true, name: "index_user_shared_places_on_user_id_and_friend_id"
  end
end
