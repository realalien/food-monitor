class AddUserIdToProductDetailEntries < ActiveRecord::Migration
  def self.up
    add_column :product_detail_entries, :user_id, :integer
  end

  def self.down
  end
end
