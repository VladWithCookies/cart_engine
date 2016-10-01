class HomeController < ApplicationController
  def index
    @order_item = OrderItem.new
    
    if Item.all.empty?
      @item = Item.create(title: "Some Product", price: 10, in_stock: 10); 
    else 
      @item = Item.first
    end
  end
end
