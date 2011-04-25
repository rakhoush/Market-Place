class Category < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  attr_accessible :name
  validates_presence_of :name, :message => "can't be blank"
end
