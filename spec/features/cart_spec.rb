  require 'spec_helper'
require 'capybara/rspec'

feature 'cart' do 
  given!(:item) { FactoryGirl.create(:item) }

  background do
    visit('/')
    click_on('ADD TO CART')
  end

  scenario 'user can remove book from cart' do
    click_on('Remove')
    expect(page).to_not have_content(item.title)
  end 

  scenario 'user can make checkout' do
    visit(cart_path)
    click_on('Checkout')
    expect(page).to have_current_path('/cart/checkout/address')
  end
  
end