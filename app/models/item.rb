class Item < ApplicationRecord

  has_one_attached :item_image
  belongs_to :item_genre, foreign_key: true

  validates :item_genre_id, presence: true
  validates :name,          presence: true
  validates :introduction,  presence: true
  validates :price,         presence: true
end
