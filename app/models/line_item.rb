class LineItem < ApplicationRecord
  belongs_to :product, foreign_key: :product_id, dependent: :destroy 
  belongs_to :cart

  def total_price 
    product.price * quantity
  end
end
