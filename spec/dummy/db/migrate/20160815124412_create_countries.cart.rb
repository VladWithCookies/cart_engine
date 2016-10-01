# This migration comes from cart (originally 20160811115204)
class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name

      t.timestamps
    end
  end
end
