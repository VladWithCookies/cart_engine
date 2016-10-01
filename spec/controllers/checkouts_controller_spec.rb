require 'spec_helper'

RSpec.describe ShoppingCart::CheckoutsController, :type => :controller do
  let!(:address) { FactoryGirl.create(:address) }
  let!(:credit_card) { FactoryGirl.create(:credit_card) }
  let!(:order) { FactoryGirl.create(:order)}

  describe "GET #delivery" do
    before { get :delivery, use_route: :shopping_cart }

    it "render delivery view" do
      expect(response).to render_template :delivery
    end
  end

  describe "POST #address_confirm" do
    it "save address to db" do
      expect {
        post :address_confirm, use_route: :shopping_cart, billing_address: FactoryGirl.attributes_for(:address), 
                                                          shipping_address: FactoryGirl.attributes_for(:address) 
      }.to change(Address, :count).by(2)
    end
  end

  describe "POST #payment_confirm" do 
    it "save credit card to db" do
      expect {
        post :payment_confirm, use_route: :shopping_cart, credit_card: FactoryGirl.attributes_for(:credit_card)
      }.to change(CreditCard, :count).by(1)
    end
  end

end