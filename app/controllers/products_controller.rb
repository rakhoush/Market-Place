class ProductsController < ApplicationController
  
  before_filter :not_admin, :only => [:create, :new, :edit, :update, :destroy]
  
  def index
    @cart = find_cart
    
    if params[:category].nil? || params[:category].blank?
      @products = Product.all
      @title = "All"
    else
      @category = Category.find(params[:category])
      @title = @category.name.titleize
      @products = Product.find(:all, :conditions => {:category_id => params[:category]})
    end
    
  end

  def show
    @product = Product.find(params[:id])
    
  end

  def new
    @product = Product.new
    @categories = Category.find(:all, :select => "id, name")
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Successfully created product."
      redirect_to @product
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.find(:all, :select => "id, name")
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product."
      redirect_to @product
    else
      render :action => 'edit'
    end
  end

  def destroy
    cart = session[:cart]
    @product = Product.find(params[:id])
    cart.remove_product(@product)
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to products_url
  end
  
  #private
  
  def add_product_to_store
   sp = Storeproduct.new(:product_id => params[:product], :store_id => params[:store])
   if sp.save
     flash[:notice] = "The product was added succesfully"
      redirect_to products_path
    else
      redirect_to :back
      flash[:error] = "Something went bad"
   end
  end
  
end
