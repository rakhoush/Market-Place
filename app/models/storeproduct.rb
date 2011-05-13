class Storeproduct < ActiveRecord::Base
  belongs_to :store
  belongs_to :product
  attr_accessor :prices
  attr_accessor :product_ids
  
  validates_numericality_of :price, :message => "is not a number"
  
   def self.find_by_store_and_product_id(store_id,product_id)
        find(:first, :conditions => "store_id = #{store_id} AND product_id = #{product_id}")
   end
   
   
   
end
