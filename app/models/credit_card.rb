class CreditCard < ApplicationRecord
  has_many :orders
  validates :number, :cvv, :expiration_month, :expiration_year, presence: true 
end
