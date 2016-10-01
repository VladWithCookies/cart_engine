module ShoppingCart 
  module Generators
    class  ControllersGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates/controllers/", __FILE__)

      def manifest
        copy_file "order_items_controller.rb", "app/controllers/shopping_cart/order_items_controller.rb"
        copy_file "checkouts_controller.rb", "app/controllers/shopping_cart/checkouts_controller.rb"
      end

    end
  end
end