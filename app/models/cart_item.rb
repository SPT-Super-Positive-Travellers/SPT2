class CartItem < ApplicationRecord
  belongs_to :item

  def subtotal
    item.with_tax_price * count
  end
  
  
end
