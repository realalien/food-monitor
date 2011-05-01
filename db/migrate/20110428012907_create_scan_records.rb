class CreateScanRecords < ActiveRecord::Migration
  def self.up
    create_table :scan_records do |t|
      t.integer :user_id
      t.integer :product_id
      t.timestamp :last_scan
      t.string :details

      t.timestamps
    end
  end

  def self.down
    drop_table :scan_records
  end
end


      # at server side, it would be json alike data format 
      # in order to allow user input any information in  in key/value
#      t.string :details
#      # ---TODO: create in other db migration if necessary. Or in Product detail table?
#      # t.string/t.id :market_place
#      # t.string :price