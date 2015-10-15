class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :restaurant 
      t.decimal :value
    end
  end
end