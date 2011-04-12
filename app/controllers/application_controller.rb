# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include SessionsHelper
  protect_from_forgery # See ActionController::RequestForgeryProtection for details


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
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
