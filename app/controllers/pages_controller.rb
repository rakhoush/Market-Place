class PagesController < ApplicationController
  
  def home
  end
  
  def cart_show
    @cart = find_cart
  end

end
