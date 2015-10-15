class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :restaurant 
      t.string :body, null: false
      t.string :username, null: false
    end
  end
end