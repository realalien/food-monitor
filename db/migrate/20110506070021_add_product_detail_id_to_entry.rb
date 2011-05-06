class AddProductDetailIdToEntry < ActiveRecord::Migration
  def self.up
    add_column :product_detail_entries , :product_detail_id, :integer
  end

  def self.down
  end
end
