class Comment < ActiveRecord::Base

  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable

  def post
    if commentable.is_a?(Post)
      return commentable
    else
      commentable.post
    end
  end
end