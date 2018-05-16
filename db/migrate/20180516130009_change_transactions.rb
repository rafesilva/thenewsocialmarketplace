class ChangeTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :item_id, :integer
    add_column :transactions, :total, :decimal, precision: 8, scale: 2, default: 0.0, null: false
    add_column :transactions, :paid, :boolean, default: false
    add_column :transactions, :stripe_charge, :string
      end
end
