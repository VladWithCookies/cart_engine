module ShoppingCart
  class ShoppingCart::ApplicationController < ActionController::Base
    protect_from_forgery with: :exception   
    add_flash_types :success, :warning, :danger, :info
    helper_method :current_order
    
    def current_order 
      @current_order = Order.find_by(id: session[:current_order_id])
      set_current_order
    end

    def set_current_order
      if @current_order.nil?
        @current_order = Order.create
        session[:current_order_id] = @current_order.id
      end 
      @current_order
    end
  end

end
