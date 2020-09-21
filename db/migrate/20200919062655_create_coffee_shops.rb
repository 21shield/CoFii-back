class CreateCoffeeShops < ActiveRecord::Migration[6.0]
  def change
    create_table :coffee_shops do |t|
      t.string :external_id
      t.string :name
      t.string :image_url
      t.string :url
      t.decimal :rating
      t.decimal :latitude
      t.decimal :longitude
      t.string :location
      t.string :price
      

      t.timestamps
    end
  end
end
