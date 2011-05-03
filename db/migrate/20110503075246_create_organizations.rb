class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.integer :country_code
      t.integer :city_code
      t.string :address
      t.string :address_en
      t.string :office_tel

      t.timestamps
    end
  end

  def self.down
    drop_table :organizations
  end
end
