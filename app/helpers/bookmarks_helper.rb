module BookmarksHelper
  
  def current_user?(user)
    user == current_user
    cookies.permanent.signed[:bookmark_token] = [user.id, bookmark.id]
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def get_all_users_for_bookmark(bookmark)
    #users = []
    #bookmark.users.each do |user|
    #  users << user.username
    #end
    #users.join(",")
    bookmark.users.map(&:username).join(", ")
  end
  
  
  private
  
    def bookmark_token
      cookies.signed[:bookmark_token] || [nil, nil]
    end
  
end
