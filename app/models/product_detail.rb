class ProductDetail < ActiveRecord::Base
    belongs_to :product    # one-to-one relation
    
    has_many :product_detail_organizations    # many-to-many relations
    #has_many :organizations, :through => :product_detail_organizations  # Q: probably too complext to manage, try later.
    # for nested model editing, may be later used in data aggregation
    accepts_nested_attributes_for :product_detail_organizations , :reject_if => lambda { |a| a[:role].blank?  || a[:orgname].blank?}, :allow_destroy => false

    # many-to-many relations without intermediate table
    has_many :product_detail_entries
    accepts_nested_attributes_for :product_detail_entries, :reject_if => lambda { |a| a[:name].blank?  || a[:value].blank? }, :allow_destroy => false
end
