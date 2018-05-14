class AddStripePaidFieldToTransaction < ActiveRecord::Migration[5.2]
  def create
    add_column :transactions, :paid, :boolean, default: false
    add_column :transactions, :stripe_charge, :string
  end
end
