class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :customer_id, presence: true
  validates :item_id,     presence: true
  validates :count,       presence: true, numericality: { in: 1..10 }


  def subtotal
    item.with_tax_price * count
  end

end
