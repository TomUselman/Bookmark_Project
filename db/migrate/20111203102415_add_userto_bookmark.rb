class AddUsertoBookmark < ActiveRecord::Migration
  def self.up
    add_column :bookmarks, :UserMade, :string
  end

  def self.down
  end
end
