class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :locality, null: false
      t.integer :zomato_id, null: false
      t.decimal :zomato_rating, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
    end
  end
end