require 'spec_helper'

describe Comment do
  it { should belong_to :commentable } 

  describe "#post" do

    it "should return the post of a first level comment" do 
      this_post = Post.create
      comment = this_post.comments.create
      comment.post.should eq this_post
    end

    it "should return the root post" do 
      this_post = Post.create
      comment1 = this_post.comments.create
      comment2 = comment1.comments.create
      comment2.post.should eq this_post
    end
  end
end
