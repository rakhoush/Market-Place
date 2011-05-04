class Storeproduct < ActiveRecord::Base
  belongs_to :store
  belongs_to :product
  
   def self.find_by_store_and_product_id(store_id,product_id)
        Storeproduct.find(:first, :conditions => "store_id = #{store_id} AND product_id = #{product_id}")
   end
end
