class ChangeVotes < ActiveRecord::Migration
  def change
    change_column(:votes, :value, :integer)

    change_table :restaurants do |t|
      t.integer :upvotes
      t.integer :downvotes
      t.integer :total_votes
    end
  end
end