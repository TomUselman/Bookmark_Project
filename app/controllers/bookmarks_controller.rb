class BookmarksController < ApplicationController
  
  # GET /bookmarks
  # GET /bookmarks.xml
  def index
    user = current_user
    @bookmarks = user.bookmarks
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookmarks }
    end
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.xml
  def show
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  # GET /bookmarks/new
  # GET /bookmarks/new.xml
  def new
    @bookmark = Bookmark.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  # GET /bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      format.html { redirect_if_current_user_not_creator(@bookmark) }
      format.xml  { render :xml => @bookmark }
    end
  end
  
  def display
    #user = current_user
    #@bookmarks = user.bookmarks
    @bookmark = Bookmark.find(params[:id])
  end

  # POST /bookmarks
  # POST /bookmarks.xml
  def create
    bookmark = Bookmark.find_or_create_by_URL(params[:bookmark][:URL])

    @user_bookmark = UserBookmark.new(:bookmark_id => bookmark.id, :user_id => current_user.id)

    respond_to do |format|
      if @user_bookmark.save
        format.html { redirect_to(bookmark, :notice => 'Bookmark was successfully created.') }
        format.xml  { render :xml => @user_bookmark, :status => :created, :location => @bookmark }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  # PUT /bookmarks/1
  # PUT /bookmarks/1.xml
  def update
    
    @bookmark = Bookmark.find(params[:id])
    
    respond_to do |format|
      if @bookmark.UserMade == current_user.username && @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to(@bookmark, :notice => 'Bookmark was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.xml
  def destroy
    @bookmark = Bookmark.find(params[:id])
    #if @bookmark.UserMade == current_user.username
      @bookmark.destroy
    #end

    respond_to do |format|
      format.html { redirect_to(bookmarks_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    
    def redirect_if_current_user_not_creator(bookmark)
      redirect_to(:bookmarks) #unless current_user.username == bookmark.UserMade
    end
end
