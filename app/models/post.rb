class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  

  def Post.sort
    sorted_posts = self.all.sort_by do |post|
      post.votes.count
    end
    sorted_posts.reverse
  end

  def points
    age_in_hours = (Time.now - self.created_at) / 3600 + 1
    points = (self.votes.count / age_in_hours).round(1)
    # degrated_points = points * 0.5
    # points - degrated_points
  end
end

