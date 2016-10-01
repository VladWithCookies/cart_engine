FactoryGirl.define do
  factory :order_item do
    price 8
    quantity 2
    item
    order
  end
end