class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  attr_accessible :author, :content, :commentable_id, :commentable_type
  
  validates_presence_of :author, :on => :create, :message => "can't be blank"
  validates_presence_of :content, :on => :create, :message => "can't be blank"
end
