class AddProductNameBarCodeToProductDetails < ActiveRecord::Migration
  def self.up
    add_column :product_details, :barcode, :string
    add_column :product_details, :product_name, :string
  end

  def self.down
  end
end
