module AcceptenceHelper
   def fill_in_address(country)
    fill_in "Firstname", with: 'Vlad', match: :prefer_exact
    fill_in "Lastname", with: 'V', match: :prefer_exact
    fill_in "Street", with: 'Green street', match: :prefer_exact 
    fill_in "City", with: 'Prague', match: :prefer_exact
    fill_in "Zip", with: '12345', match: :prefer_exact
    fill_in "Phone", with: '1234567891', match: :prefer_exact
    select country.name, match: :prefer_exact
    click_on('Save')
  end

  def fill_in_invalid_address
    fill_in "Zip", with: '123', match: :prefer_exact
    fill_in "Phone", with: '123', match: :prefer_exact
    click_on('Save')
  end

  def fill_in_credit_card(card)
    fill_in "Card number", with: card.number
    fill_in "Card code", with: card.cvv
    select Date::MONTHNAMES.last
    select Time.now.year
    click_on('Save')
  end

  def fill_in_invalid_credit_card
    select Date::MONTHNAMES.last
    select Time.now.year
    click_on('Save')
  end

end