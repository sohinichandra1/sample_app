class CreateUserPlaces < ActiveRecord::Migration
  def change
    create_table :user_places do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :place_id
      t.boolean :public, default: false

      t.timestamps null: false
    end

    add_index :user_places, :user_id
    add_index :user_places, :place_id
  end
end
