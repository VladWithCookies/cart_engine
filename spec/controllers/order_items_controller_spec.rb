require 'spec_helper'

RSpec.describe ShoppingCart::OrderItemsController, :type => :controller do
  let!(:order_item) { FactoryGirl.create(:order_item) }
  let!(:item) { FactoryGirl.create(:item) }

  describe "GET #index" do
    before { get :index, use_route: :shopping_cart }

    it "assigns @order" do
      expect(assigns(:order)).not_to be_nil
    end

    it "return list of order_items" do
      expect(assigns(:order_items)).not_to be_nil
    end

    it "render index view" do
      expect(response).to render_template :index
    end
  end

  describe "GET #destroy_item" do
    it "destroy order item" do
      expect do
        get :destroy_item, use_route: :shopping_cart, id: order_item.id
      end.to change(OrderItem, :count).by(-1)
    end

    it 'redirect to cart_path' do
      get :destroy_item, use_route: :shopping_cart, id: order_item.id
      expect(response).to redirect_to('/cart/order_items')
    end
  end

  describe "POST #create" do
    it "add new order item to db" do
      expect {
        post :create, use_route: :shopping_cart, order_item: { item_id: item, quantity: 1}
      }.to change(OrderItem, :count).by(1)
    end

    it 'redirect to cart_path' do
      post :create, use_route: :shopping_cart, order_item: { item_id: item, quantity: 1}
      expect(response).to redirect_to('/cart/order_items')
    end
  end

end