class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|

      t.timestamps
      t.string :username
      t.string :password
    end
  end

  def self.down
    drop_table :users
  end
end
