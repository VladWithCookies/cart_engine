class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :image
      t.text :description
      t.decimal :price
      t.integer :in_stock
      t.timestamps
    end
  end
end
