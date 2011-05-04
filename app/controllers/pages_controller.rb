class PagesController < ApplicationController
  
  def home
    @feeds = Feed.find(:all, :order => "created_at DESC")
    @products = Product.find(:all, :limit => 10)
  end
  
  def cart_show
    @cart = find_cart
  end

end
