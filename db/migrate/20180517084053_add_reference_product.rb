class AddReferenceProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :product, index: true
  end
end
