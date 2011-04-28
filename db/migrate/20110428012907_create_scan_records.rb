class CreateScanRecords < ActiveRecord::Migration
  def self.up
    create_table :scan_records do |t|
      t.integer :user_id
      t.integer :product_id
      t.timstamp :last_scan
      t.string :details

      t.timestamps
    end
  end

  def self.down
    drop_table :scan_records
  end
end
