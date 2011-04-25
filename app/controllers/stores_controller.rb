class StoresController < ApplicationController
  
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :not_admin, :only => [:index, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  
  def index
    @stores = Store.all
    @title = "All users"
  end

  def show
    @store = Store.find(params[:id])
    @title = "Store profile"
  end

  def new
    @store = Store.new
    @user = User.new
    @title = "New store"
  end

  def create
    @store = Store.new(params[:store])
    @user = @store.build_user(params[:user])
    if @store.save
      Notifier.deliver_succesful_registration(@store)
      sign_in @user
      flash[:notice] = "Welcome back #{@user.name.titleize}"
      redirect_to @store
    else
      render :action => 'new'
    end
  end

  def edit
    @store = Store.find(params[:id])
    @user = @store.user
    @title = "Edit store"
  end

  def update
    @store = Store.find(params[:id])
    @user = User.find_by_userable_id(@store.id)
    if @store.update_attributes(params[:store]) and @user.update_attributes(params[:user])
      flash[:notice] = "Profile succesfully updated"
      redirect_to :back
    else
      render :action => 'edit'
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    flash[:notice] = "Successfully destroyed store."
    redirect_to stores_url
  end
  
  def owned_products
    @store = Store.find(current_user.userable_id)
  end
  
  def set_price_for_product
    store = Store.find(params[:storeproduct][:store_id])
    sp = store.storeproducts.find_by_product_id(params[:storeproduct][:product_id])
    sp.price = params[:storeproduct][:price].to_f
    if sp.save
      flash[:notice] = "Price was set"
      redirect_to :back
    end
  end
  
  
end
