module SessionsHelper
  
  def sign_in(user)
      user.remember_me!
      cookies[:remember_token] = { :value   => user.remember_token,
                                   :expires => 20.years.from_now.utc }
      self.current_user = user
  end
  
  def current_user=(user)
      @current_user = user
  end
  
  def current_user
   @current_user ||= user_from_remember_token
  end
  
  def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token) unless remember_token.nil?
  end
  
  def signed_in?
      !current_user.nil?
  end
  
  def sign_out
      cookies.delete(:remember_token)
      self.current_user = nil
  end
  
  def deny_access
    flash[:notice] = "Please sign in to access this page."
    redirect_to signin_path
  end
  
  def deny_not_admin_access
    flash[:error] = "Access denied"
    redirect_to root_path
  end
  
  def identify_user
    if current_user.userable_type == "Store"
      return Store.find(current_user.userable_id)
    else
      return current_user
    end
  end
  
  def current_user?(user)
    user.id == current_user.userable_id
  end
  
end
