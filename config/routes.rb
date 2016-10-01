ShoppingCart::Engine.routes.draw do
  get "/" => "order_items#index"
  post "/update_all" => "order_items#update_all"
  delete "/empty" => "order_items#empty_cart"

  resources :orders
  resources :order_items  
  
  ShoppingCart.checkout_steps.each do |step|
    get "/checkout/#{step}" => "checkouts##{step}"
  end

  get "/destroy_item/:id" => "order_items#destroy_item"

  post  "/checkout/address" => "checkouts#address_confirm"
  post  "/checkout/delivery" => "checkouts#delivery_confirm"
  post  "/checkout/payment" => "checkouts#payment_confirm"
end
