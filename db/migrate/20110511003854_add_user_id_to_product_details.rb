class AddUserIdToProductDetails < ActiveRecord::Migration
  def self.up
    add_column :product_details, :user_id, :integer
  end

  def self.down
  end
end
