class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :favorites

  def voted_rating
    rating = (upvotes.to_f / total_votes * 100).round(1)

    if total_votes == 0
      "---"
    elsif rating == 100
      rating.to_i
    else
      rating
    end
  end
end