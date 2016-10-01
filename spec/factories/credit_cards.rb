FactoryGirl.define do
  factory :credit_card do
    cvv              '12345'
    expiration_month 'Junuary'
    expiration_year  2016
    number           12345678910
  end
end