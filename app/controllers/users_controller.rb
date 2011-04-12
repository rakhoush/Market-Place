class UsersController < ApplicationController
 
  before_filter :not_admin
 
  def index
    @users = User.all
    @title = "All users"
  end
  
  def show
    @user = User.find(params[:id])
    @title = "Profile"
  end
  
  def new
    @user = User.new
    @title = "New user"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Editing user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      
      flash[:notice] = "Successfully updated user."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
  
  private
  
  def find_userable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
end
