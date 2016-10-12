ShoppingCart::Engine.routes.draw do
  get "/" => "order_items#index"
  post "/update_all" => "order_items#update_all"
  delete "/empty" => "order_items#empty_cart"

  resources :orders
  resources :order_items  
  
  ShoppingCart.checkout_steps.each do |step|
    get "/checkout/#{step}" => "checkouts##{step}"
    post "/checkout/#{step}" => "checkouts##{step}_confirm"
  end
end
