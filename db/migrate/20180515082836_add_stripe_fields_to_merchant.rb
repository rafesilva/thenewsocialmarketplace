class AddStripeFieldsToMerchant < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :uid, :string
    add_column :merchants, :provider, :string
    add_column :merchants, :access_code, :string
    add_column :merchants, :publishable_key, :string
  end
end
