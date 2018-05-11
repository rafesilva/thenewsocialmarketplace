class LineItem < ApplicationRecord
  belongs_to :product, dependent: :destroy 
  belongs_to :cart

  def total_price 
    product.price * quantity
  end
end
