class AddProductNameToProductDetail < ActiveRecord::Migration
  def self.up
    add_column :product_details, :name, :string 
  end

  def self.down
  end
end
