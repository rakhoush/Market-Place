class Product < ActiveRecord::Base
  belongs_to :category
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :stores, :through => :storeproducts
  has_many :storeproducts
  attr_accessible :name, :description, :category_id
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :description, :on => :create, :message => "can't be blank"
  validates_presence_of :category_id, :on => :create, :message => "can't be blank"
end
