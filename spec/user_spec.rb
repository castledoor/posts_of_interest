require 'spec_helper'

describe User do
  it { should have_secure_password }
  it "should not allow duplicate usernames" do
    user1 = User.create(:username => "jim", :password => "green", :password_confirmation => "green")
    user2 = User.new(:username => "jim", :password => "green", :password_confirmation => "green")
    user2.valid?.should eq false
  end
end