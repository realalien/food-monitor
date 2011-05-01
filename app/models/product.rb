class Product < ActiveRecord::Base
  has_many :scan_records
  has_many :users , :through => :scan_records  #
end
