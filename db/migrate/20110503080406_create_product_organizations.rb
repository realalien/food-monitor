class CreateProductOrganizations < ActiveRecord::Migration
  def self.up
    create_table :product_organizations do |t|
      t.integer :product_id
      t.integer :organization_id
      t.string :role
      t.integer :added_by_user
      t.timestamp :last_update

      t.timestamps
    end
  end

  def self.down
    drop_table :product_organizations
  end
end
