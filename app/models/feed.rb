class Feed < ActiveRecord::Base
  attr_accessible :title, :author, :content
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :author, :on => :create, :message => "can't be blank"
  validates_presence_of :content, :on => :create, :message => "can't be blank"
end
