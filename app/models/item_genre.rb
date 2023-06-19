class ItemGenre < ApplicationRecord
  has_many :items, foreign_key: true
end
