class ChangeDatesavedToDatetime < ActiveRecord::Migration
  def self.up
    remove_column :bookmarks, :DateSaved
    add_column :bookmarks, :date_saved, :datetime
  end

  def self.down
  end
end
