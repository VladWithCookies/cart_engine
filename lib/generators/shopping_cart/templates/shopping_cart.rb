ShoppingCart.setup do |config|
  config.item_class = 'Product'
  config.checkout_steps = %w(address delivery payment confirm complete)
end