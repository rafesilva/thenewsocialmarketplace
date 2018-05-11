class AddPublicToUsers < ActiveRecord::Migration[5.2]

  def change
    change_column :users, :url, 'boolean USING CAST(url AS boolean)'

  end



end