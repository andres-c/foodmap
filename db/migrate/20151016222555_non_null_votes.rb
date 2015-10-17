class NonNullVotes < ActiveRecord::Migration
  def change
    change_column :restaurants, :upvotes, :integer, default: 0, null: false
    change_column :restaurants, :downvotes, :integer, default: 0, null: false
    change_column :restaurants, :total_votes, :integer, default: 0, null: false
  end
end