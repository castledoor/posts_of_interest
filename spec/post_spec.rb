require 'spec_helper'

describe Post do

  it { should have_many :votes }
  it { should belong_to :user }
  
  it "sorts posts by number of votes" do
    user1 = User.create( :username => "blah1", :password => "blah")
    user2 = User.create( :username => "blah2", :password => "blah")
    user3 = User.create( :username => "blah3", :password => "blah")
    post1 = Post.create(:link => "link", :description => "description", :user_id => user1.id)
    post2 = Post.create(:link => "link", :description => "description", :user_id => user2.id)
    post3 = Post.create(:link => "link", :description => "description", :user_id => user3.id)
    vote1 = Vote.create(:user_id => 4, :post_id => post2.id)
    vote6 = Vote.create(:user_id => 2, :post_id => post2.id)
    vote2 = Vote.create(:user_id => 4, :post_id => post1.id)
    vote3 = Vote.create(:user_id => 3, :post_id => post3.id)
    vote4 = Vote.create(:user_id => 2, :post_id => post3.id)
    vote5 = Vote.create(:user_id => 4, :post_id => post3.id)
    Post.sort.should eq [post3, post2, post1]
  end

  it "sets the number of points to the number of votes before 60 minutes has passed" do
    post = Post.create
    vote1 = Vote.create(:user_id => 1, :post_id => post.id)
    vote2 = Vote.create(:user_id => 2, :post_id => post.id)
    vote3 = Vote.create(:user_id => 3, :post_id => post.id)
    vote4 = Vote.create(:user_id => 4, :post_id => post.id)
    vote5 = Vote.create(:user_id => 5, :post_id => post.id)
    post.points.should eq 5
  end

  it "divides the number of votes by the age in hours" do
    post = Post.create
    vote1 = Vote.create(:user_id => 1, :post_id => post.id)
    vote2 = Vote.create(:user_id => 2, :post_id => post.id)
    vote3 = Vote.create(:user_id => 3, :post_id => post.id)
    vote4 = Vote.create(:user_id => 4, :post_id => post.id)
    vote5 = Vote.create(:user_id => 5, :post_id => post.id)
    sixty_minutes_from_now = Time.now + 60.minutes
    Time.stub(:now).and_return(sixty_minutes_from_now)
    post.points.should eq 2.5
  end

  it "divides the number of votes by the age in hours" do
    post = Post.create
    vote1 = Vote.create(:user_id => 1, :post_id => post.id)
    vote2 = Vote.create(:user_id => 2, :post_id => post.id)
    vote3 = Vote.create(:user_id => 3, :post_id => post.id)
    vote4 = Vote.create(:user_id => 4, :post_id => post.id)
    vote5 = Vote.create(:user_id => 5, :post_id => post.id)
    vote6 = Vote.create(:user_id => 6, :post_id => post.id)
    onehundredtwenty_minutes_from_now = Time.now + 120.minutes
    Time.stub(:now).and_return(onehundredtwenty_minutes_from_now)
    post.points.should eq 2
  end

    # post = Post.new(time.now - :created_at => '2013-10-01 19:35:12.528988') / 3600
    # vote = Vote.new(figure out number of votes)
    # points = post * vote
    # post.hourly_degrade((:created_at - time.now * votes ))

    # thirty_one_minutes_from_now = Time.now + 31.minutes
    # Time.stub(:now).and_returns(thirty_one_minutes_from_now)
end