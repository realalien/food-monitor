class ProductDetail < ActiveRecord::Base
    belongs_to :product
    
    has_many :organization_roles
    has_many :organizations, :through => :organization_roles
end
