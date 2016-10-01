class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item, class_name: ShoppingCart.item_class
  validates :price, :quantity, presence: true

  after_commit :update_price

  scope :from_order, -> (id) { where(order_id: id) }

  def update_price
    total = item.price * quantity
    update_columns(price: total)
    total
  end

end
