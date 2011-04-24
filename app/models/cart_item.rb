class CartItem

  attr_reader :product, :quantity
  
  def initialize(product)
    @product = product
    @quantity = 1
  end
  
  def increment_quantity
    @quantity += 1
  end

  def name
    @product.name  
  end

  def price
    @product.price * @quantity
  end
  
  def stores
    @product.stores
  end
  
  def id
    @product.id
  end
  
  def total_price(item)
    sum = 0.0
    item.stores.each do |i|
      sum += i.storeproducts.find_by_product_id(item.id).price
    end
    sum
  end

end