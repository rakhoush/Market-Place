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
    
    500.times do |n|
      product_id = rand(499) + 1
      store_id = rand(2) + 1
      price = (n * 2.5) / 0.3
      Storeproduct.create!(:product_id => product_id,
                           :store_id => store_id,
                           :price => price)
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
    
    1000.times do |n|
      author = Faker::Name.name
      content = "Some dummy content from #{author}"
      title = "Title for article #{n+1}"
      Article.create!(:author => author,
                      :title => title,
                      :content => content)
    end
    
  end
end