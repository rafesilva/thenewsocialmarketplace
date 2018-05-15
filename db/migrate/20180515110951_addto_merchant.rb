class AddtoMerchant < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :title, :string
    add_column :merchants, :description, :string
    add_reference :merchants, :user, index: true

   
  end
end
