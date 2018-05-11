class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :leader_id
      t.integer :follower_id

      t.timestamps
    end
    add_index :subscriptions, :leader_id
    add_index :subscriptions, :follower_id
  end
end
