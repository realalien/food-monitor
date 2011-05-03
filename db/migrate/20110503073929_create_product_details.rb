class CreateProductDetails < ActiveRecord::Migration
  def self.up
    create_table :product_details do |t|
      t.integer :product_id
      t.float :net_weight_g
      t.string :pkg_unit
      t.integer :shelf_life_d
      t.string :std_followed
      t.string :aggregate_info

      t.timestamps
    end
  end

  def self.down
    drop_table :product_details
  end
end
