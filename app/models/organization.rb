class Organization < ActiveRecord::Base
    has_many :product_organizations
    has_many :products, :through => :product_organization
    
    # for geo coding
    geocoded_by :full_address
    after_validation :geocode
    
    def full_address
        return address
        # SUG: try to use multiple map service to pin point the accurate address and geo code.
    end
    
end
