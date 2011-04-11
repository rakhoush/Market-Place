ActionController::Routing::Routes.draw do |map|
  map.resources :stores, :has_one => :user
  map.resources :sessions, :only => [:new, :create, :destroy]
  map.signup '/signup', :controller => "users", :action => "new"
  map.signin '/signin', :controller => "sessions", :action => "new"
  map.signout '/signout', :controller => "sessions", :action => "destroy"
  map.resources :users
  map.root :controller => :users
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
