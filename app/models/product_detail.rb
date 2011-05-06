class ProductDetail < ActiveRecord::Base
    belongs_to :product    # one-to-one relation
    
    has_many :product_organizations    # many-to-many relations
    has_many :organizations, :through => :product_organizations
    
    # for nested model editing
    accepts_nested_attributes_for :product_organizations, :reject_if => lambda { |a| a[:role].blank? }, :allow_destroy => false
    
end
