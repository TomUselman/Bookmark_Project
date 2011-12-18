class AddEmailAndRealNameToUsers < ActiveRecord::Migration
  def self.up
    add_column(:users, :email, :string)
    add_column(:users, :real_name, :string)
  end

  def self.down
    remove_column(:users, :email)
    remove_column(:users, :real_name)
  end
end
