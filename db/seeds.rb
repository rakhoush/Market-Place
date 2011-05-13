# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create!(:name => "Abraham", 
             :email => "abraham.kuri@gmail.com", 
             :password => "frxhgroi", 
             :password_confirmation => "frxhgroi", 
             :admin => "1")

User.create!(:name => "Andrei", 
            :email => "andrej.berglund@gmail.com", 
            :password => "marketplace", 
            :password_confirmation => "marketplace", 
            :admin => "1")