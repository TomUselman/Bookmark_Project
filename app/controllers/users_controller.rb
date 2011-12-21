class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:update]
  
  def new
    @user = User.new
    @title = "Bookmark_Project1"
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.username
  end
  
  def upload_avatar
    
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to our Bookmark Site!"
      redirect_to root_path
    else
      @title = "Bookmark_Project1"
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Bookmark_Project1"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated Successfully!"
      redirect_to @user
    else
      @title = "Bookmark_Project1"
      render 'edit'
    end
  end
  
  private

    def authenticate
      deny_access unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
