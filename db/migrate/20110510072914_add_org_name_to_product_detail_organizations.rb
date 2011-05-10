class AddOrgNameToProductDetailOrganizations < ActiveRecord::Migration
  def self.up
    add_column :product_detail_organizations, :orgname, :string
  end

  def self.down
  end
end
