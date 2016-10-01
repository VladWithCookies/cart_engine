class Order < ApplicationRecord
  include AASM
  extend Enumerize

  belongs_to :credit_card
  belongs_to :billing_address, class_name: 'Address'
  belongs_to :shipping_address, class_name: 'Address'
  has_many :order_items

  after_initialize :init
  after_update :get_item_total
  after_update :get_order_total

  def init 
    self.item_total ||= 0
    self.shipping ||= 0
    self.discount ||= 0
    self.credit_card ||= CreditCard.new
    self.billing_address ||= Address.new
    self.shipping_address ||= Address.new
  end

  aasm column: :state do
    state :in_progress, initial: true
    state :in_queue
    state :in_delivery
    state :delivered
    state :canceled

    event :place_order do
      transitions to: :in_queue, from: :in_progress
    end

    event :ship do
      transitions to: :in_delivery, from: :in_queue
    end
    
    event :complete do
      transitions to: :delivered, from: :in_delivery
    end

    event :cancel do
      transitions to: :canceled, from: :in_queue
    end
  end

  enumerize :state, in: aasm.states

  def add_item(item_id, quantity)
    item = ShoppingCart.item_class.constantize.find_by(id: item_id)
    order_item = order_items.find_by(item_id: item_id)
    if order_item
      order_item.quantity += quantity
      order_item.save
    else
      order_items.create(price: item.price, quantity: quantity, item: item)
    end
    get_item_total
  end

  def get_item_total
    total = order_items.inject(0) { |sum, item| sum + item.price } - discount
    update_columns(item_total: total)
    total
  end

  def get_order_total
    total = item_total + shipping
    update_columns(order_total: total)
    total
  end

end
