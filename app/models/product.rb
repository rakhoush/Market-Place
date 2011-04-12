class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :description, :category_id
end
