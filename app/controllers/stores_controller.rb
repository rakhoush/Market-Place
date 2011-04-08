class StoresController < ApplicationController
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
      flash[:notice] = "Successfully created store."
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
      flash[:notice] = "Successfully updated store."
      redirect_to @store
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
  
  
end
