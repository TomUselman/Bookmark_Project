require 'spec_helper'

describe Bookmark do
  before(:each) do
    @mock_bookmark = Bookmark.new(:Name => "name", :URL => "www.google.com", :UserMade => "Test User")
  end
  
  before(:each) do
    @user = Factory(:user)
    @attr = { :content => "value for content" }
  end
  
  it "should create a new instance given valid attributes" do
    @user.bookmark.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @mock_bookmark = @user.mock_bookmark.create(@attr)
    end

    it "should have a user attribute" do
      @mock_bookmark.should respond_to(:user)
    end

    it "should have the right associated user" do
      @mock_bookmark.user_id.should == @user.id
      @mock_bookmark.user.should == @user
    end
    it "should not save if there is no URL" do
      @mock_bookmark.URL = nil
      @mock_bookmark.save.should == false
    end
    it "should not save if URL length is less than 10" do
      @mock_bookmark.URL = "URL"
      @mock_bookmark.save.should == false
    end
    it "should not save if there is no name" do
      @mock_bookmark.Name = nil
      @mock_bookmark.save.should == false
    end
    it "should not save if the name is greater than 100 characters" do
      name = ""
      101.times { name += "a" }
      @mock_bookmark.Name = name
      @mock_bookmark.save.should == false
    end
    
    it "should not save if there is no Created User" do
      @mock_bookmark.UserMade= nil
      @mock_bookmark.save.should == false
    end
    it "should save when all validations are satisfied" do
      @mock_bookmark.save.should == true
    end
  end
end
