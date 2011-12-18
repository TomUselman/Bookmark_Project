class SessionsController < ApplicationController
  
  def new
    @title = "Bookmark_Project1"
    respond_to do |format|
      format.html { redirect_to :bookmarks if signed_in? }
    end
  end
  
  def create
    user = User.authenticate(params[:session][:username],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Bookmark_Project1"
      render 'new'
    else
      sign_in user
      
      redirect_to :bookmarks
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end


end
