# == Schema Information
# Schema version: 20110407160817
#
# Table name: stores
#
#  id         :integer(4)      not null, primary key
#  zip        :string(255)
#  street     :string(255)
#  number     :string(255)
#  district   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Store < ActiveRecord::Base
  
  #Database relations
  has_one :user, :as => :userable, :dependent => :destroy
  has_many :products, :through => :storeproducts
  has_many :storeproducts
  accepts_nested_attributes_for :user
  
  attr_accessible :name, :user_attributes
  attr_accessible :zip, :street, :number, :district
  
  #Validations for the store model
  validates_presence_of :zip, :on => :create, :message => "can't be blank"
  validates_presence_of :street, :on => :create, :message => "can't be blank"
  validates_presence_of :number, :on => :create, :message => "can't be blank"
  validates_presence_of :district, :on => :create, :message => "can't be blank"
  
  def address
    "#{self.number}, #{self.street.titleize}, #{self.district.titleize} #{self.zip}"
  end  
  
end
