class Organization < ActiveRecord::Base
    has_many :product_organizations
    has_many :products, :through => :product_organization
end
