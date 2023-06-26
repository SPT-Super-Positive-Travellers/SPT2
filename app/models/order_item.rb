class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def total_price
    item.with_tax_price.to_i * count.to_i
  end
end
