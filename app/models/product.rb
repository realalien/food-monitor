

class Product < ActiveRecord::Base
  has_many :scan_records
  has_many :users , :through => :scan_records  #
  
  
  
  # because many users will contribute product details, the 'Product' table is actually collection of 
  # machine generated 
  has_many :product_detail
end
