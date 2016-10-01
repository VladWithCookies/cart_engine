require 'spec_helper'
require 'capybara/rspec'

feature 'checkout' do 
  given!(:item) { FactoryGirl.create(:item) }
  given!(:country) { FactoryGirl.create(:country) }
  given!(:credit_card) { FactoryGirl.create(:credit_card) }

  background do 
    visit('/') 
    click_on('ADD TO CART') 
    click_on('Checkout') 
  end

  scenario 'user fill billing and shipping address' do
    fill_in_address(country)
    click_on('Save')
    expect(page).to have_current_path('/cart/checkout/delivery')
  end

  scenario 'user fill invalid billing and shipping address' do
    click_on('Save')
    expect(page).to have_current_path('/cart/checkout/address')
  end

  scenario 'user fill credit card info' do
    fill_in_address(country)
    click_on('Save')
    click_on('Save')

    fill_in_credit_card(credit_card)
    click_on('Save')

    expect(page).to have_current_path('/cart/checkout/confirm')
  end

  scenario 'user fill invalid credit card info' do
    fill_in_address(country)
    click_on('Save')
    click_on('Save')
    click_on('Save')
    expect(page).to have_current_path('/cart/checkout/payment')
  end

  scenario 'user choose shipment method' do 
    fill_in_address(country)
    click_on('Save')
    click_on('Save')

    expect(page).to have_current_path('/cart/checkout/payment')
  end

  scenario 'user confirm checkout' do
    fill_in_address(country)
    click_on('Save')
    click_on('Save')

    fill_in_credit_card(credit_card)
    click_on('Save')

    expect(page).to have_current_path('/cart/checkout/confirm')
  end

  scenario 'user place order' do 
    fill_in_address(country)
    click_on('Save')
    click_on('Save')
    fill_in_credit_card(credit_card)
    click_on('Save')

    click_on('Place order')

    expect(page).to have_current_path('/cart/checkout/complete')
  end
end