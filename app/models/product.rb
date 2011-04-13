class Product < ActiveRecord::Base
  belongs_to :category
  has_many :comments, :as => :commentable, :dependent => :destroy
  attr_accessible :name, :description, :category_id
end
