class Article < ActiveRecord::Base
  
  validates_presence_of :title, :message => "can't be blank"
  validates_presence_of :author, :message => "can't be blank"
  validates_presence_of :content, :message => "can't be blank"
  
  attr_accessible :title, :author, :content
end
