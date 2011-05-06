class ProductOrganization < ActiveRecord::Base
    belongs_to :organization
    belongs_to :product_detail
    
end
