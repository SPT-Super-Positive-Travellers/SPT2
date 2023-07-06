class Item < ApplicationRecord

  has_one_attached :item_image
  has_many :cart_items
  has_many :order_items
  belongs_to :item_genre

  validates :item_genre_id, presence: true
  validates :name,          presence: true
  validates :introduction,  presence: true
  validates :price,         presence: true

  def item_status
    if is_availabled == true
      "販売中"
    else
      "販売停止中"
    end
  end

  def with_tax_price
    ( price * 1.1 ).floor
  end
end
