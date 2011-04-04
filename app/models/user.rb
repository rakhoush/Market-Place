# == Schema Information
# Schema version: <timestamp>
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :email
  
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :email, :message => "can't be blank"
  validates_format_of :email, :with => EmailRegex, :message => "is invalid"
  validates_uniqueness_of :email, :message => "has been already taken", :case_sensitive => false
  
end
