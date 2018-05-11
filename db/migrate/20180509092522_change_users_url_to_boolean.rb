class ChangeUsersUrlToBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :url, :boolean, default: false
  end
  
end
