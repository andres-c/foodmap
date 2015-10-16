class AddRatingToReviews < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.string :rating
      t.timestamps null: false
    end
  end
end