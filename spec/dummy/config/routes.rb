Rails.application.routes.draw do
  get '/' => 'home#index'
  mount ShoppingCart::Engine => "/cart", as: :cart
end
