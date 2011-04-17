class PagesController < ApplicationController
  
  def home
    @feeds = Feed.find(:all, :order => "created_at DESC")
  end
  
  def cart_show
    @cart = find_cart
  end

end
