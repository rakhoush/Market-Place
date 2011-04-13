require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    #Rake::Task['db:reset'].invoke
    500.times do |n|
      name  = "ProductTest-#{n+1}"
      description = "Some dummy text for testing purposes for product number #{n+1}"
      category_id  = rand(3) + 1
      Product.create!(:name => name,
                      :description => description,
                      :category_id => category_id)
      
    end
    
    5000.times do |n|
    author = Faker::Name.name
    content = "Some dummy content from #{author}"
    commentable_id = rand(500) + 1
    commentable_type = "Product"
    Comment.create!(:author => author,
                    :content => content,
                    :commentable_id => commentable_id,
                    :commentable_type => commentable_type)
    end
    
  end
end