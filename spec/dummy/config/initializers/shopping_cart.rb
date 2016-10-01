ShoppingCart.setup do |config|
  #tour product model name
  config.item_class = 'Item'

  #checkout steps that you want to have
  config.checkout_steps = %w(address delivery payment confirm complete)
end