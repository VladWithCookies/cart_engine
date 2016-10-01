class Address < ApplicationRecord
  validates :street, :zipcode, :city, :phone, :country, presence: true
end
