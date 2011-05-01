class ScanRecord < ActiveRecord::Base
    belongs_to :user
    belongs_to :products
end
