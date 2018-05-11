class AddImageFileToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image_file, :string

  end
end
