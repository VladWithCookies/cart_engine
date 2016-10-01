module ShoppingCart
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates/", __FILE__)

      def manifest
        copy_file 'shopping_cart.rb', "config/initializers/shopping_cart.rb"
      end
    end
  end
end