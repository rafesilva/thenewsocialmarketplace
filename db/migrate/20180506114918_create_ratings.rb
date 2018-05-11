class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :leader_id
      t.integer :follower_id

      t.timestamps
    end
    add_index :ratings, :leader_id
    add_index :ratings, :follower_id
  end
end
