class Item < ApplicationRecord
  has_many :order_items
  validates :title, :price, :in_stock, presence: true
end
