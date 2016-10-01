class CreditCardForm < Reform::Form
  property :cvv
  property :expiration_year
  property :expiration_month
  property :number
  validates :number, :cvv, :expiration_year, :expiration_month, presence: true
end