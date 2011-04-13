# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include SessionsHelper
  protect_from_forgery :secret => '8fc080370e56e929a2d5afca5540a0f7'# See ActionController::RequestForgeryProtection for details

    def authenticate
      deny_access unless signed_in?
    end
    
    def not_admin
      unless signed_in?
        deny_not_admin_access
      else
         deny_not_admin_access unless current_user.admin?
      end
    end
    
    def correct_user
      if current_user.userable_type == "Store"
        store = Store.find(params[:id])
        redirect_to(root_path) unless current_user?(store) or current_user.admin?
      end
    end
    
    def find_cart
      session[:cart] ||= Cart.new
    end
    
    def remove_from_cart
      product = Product.find(params[:id])
      cart = find_cart
      items = cart.items
      current_item = items.find {|item| item.product == product}
      if current_item
        items.delete_if{|i| i == current_item}
        redirect_to products_path
      end
    end
    
    def add_to_cart
      product = Product.find(params[:id])
      @cart = find_cart
      @cart.add_product(product)
      redirect_to products_path
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}" )
      flash[:error] = "Can't add the product because is invalid"
      redirect_to products_path
    end
    
    def empty_cart
      session[:cart] = nil
      flash[:notice] = "Your cart is currently empty"
      redirect_to products_path
    end
    
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
