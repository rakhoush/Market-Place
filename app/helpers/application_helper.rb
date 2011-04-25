# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def title
    base_title = "Market Place"
    if @title.nil?
      base_title
    else
      "#{base_title} :: #{h(@title)}"
    end
  end

  
  def find_current_cart
   if session[:cart].nil?
     Cart.new.all_items
   else
      session[:cart].all_items
   end
  end
  

  def categories
    @categories = Category.find(:all, :select => "id, name")
  end
  
end
