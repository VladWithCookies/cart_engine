require "shopping_cart/engine"
require "aasm"
require "reform/rails"

module ShoppingCart
  mattr_accessor :item_class
  mattr_accessor :checkout_steps
  
  @@item_class = 'Item'
  @@checkout_steps = %w(address delivery payment confirm complete)

  def self.setup
    yield self
  end
end
