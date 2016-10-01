require 'spec_helper'

describe Address do 
  subject { FactoryGirl.create(:address) }

  context "validations" do
    [:street, :zipcode, :city, :phone, :country].each do |field|
      it "is invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end
end