# ShoppingCart
Just adds cart and checkout functionality to your app.

## Installation & Configuration
Add this line to your application's Gemfile:

```ruby
gem 'shopping_cart'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install shopping_cart
```

Next copy migrations:
```ruby
rake shopping_cart:install:migrations
rake db:migrate
```

Next run built-in generator:
```ruby
rails g shopping_cart:install
```

And add this to your config/routes.rb
```ruby
mount ShoppingCart::Engine => '/cart', as: 'cart'
```

Next you need to specify product model in your config/initializers/shopping_cart.rb:
```ruby
ShoppingCart.setup do |config|
  #tour product model name
  config.item_class = 'Product'

  #checkout steps that you want to have
  config.checkout_steps = %w(address delivery payment confirm complete)
end
```

## Customization
### Views
You can get shopping cart views to customize it by running:
```ruby
rails g shopping_cart:views
```
### Controllers
You can get shopping cart controllers to customize it by running:
```ruby
rails g shopping_cart:controllers
```
### Add custom steps to checkout
In your config/initializers/shopping_cart.rb:
```ruby
ShoppingCart.setup do |config|
  #tour product model name
  config.item_class = 'Product'

  #checkout steps that you want to have
  config.checkout_steps = %w(address delivery custom_step payment confirm complete)
end
```

In your controllers/shopping_cart/checkout_controller.rb:
```ruby
require_dependency ShoppingCart::Engine.config.root.join('app', 'controllers', 'shopping_cart', 'checkouts_controller.rb').to_s

class ShoppingCart::CheckoutsController
  def custom_step
    #custom_step action code goes here
  end
end
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
