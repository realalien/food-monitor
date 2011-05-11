class AddUserScreenNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :screen_name, :string
  end

  def self.down
  end
end
