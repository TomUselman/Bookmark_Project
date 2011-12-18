class Bookmark < ActiveRecord::Base
  validates(:URL, :presence => true)
  validates :URL, :length => { :minimum => 10 }
  #validates(:Name, :presence => true)
  #validates :Name, :length => { :maximum => 100}
  #validates(:UserMade, :presence => true)
  
  has_many :user_bookmarks
  has_many :users, :through => :user_bookmarks
  
  

end
