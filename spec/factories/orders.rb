FactoryGirl.define do
  factory :order do
    order_total 50 
    shipping  5
    item_total 45
    state 'in_progress'
    discount 0
    credit_card      
    association :billing_address, factory: :address
    association :shipping_address, factory: :address
  end
end