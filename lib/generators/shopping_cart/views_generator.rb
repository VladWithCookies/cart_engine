module ShoppingCart 
  module Generators
    class  ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates/views/", __FILE__)

      def manifest
        %w(_address_form _order_table address complete confirm delivery payment).each do |f|
          copy_file "checkouts/#{f}.html.erb", "app/views/checkouts/#{f}.html.erb"
        end

        %w(_order_item _sub_total index).each do |f|
          copy_file "order_items/#{f}.html.erb", "app/views/order_items/#{f}.html.erb"
        end
      end

    end
  end
end