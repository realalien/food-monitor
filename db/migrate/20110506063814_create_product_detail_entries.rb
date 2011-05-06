class CreateProductDetailEntries < ActiveRecord::Migration
  def self.up
    create_table :product_detail_entries do |t|
      t.string :name
      t.string :value
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :product_detail_entries
  end
end
