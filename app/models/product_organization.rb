class ProductOrganization < ActiveRecord::Base
    belongs_to :organization
    belongs_to :product_detail
    
    accepts_nested_attributes_for :organizations, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => false
end
