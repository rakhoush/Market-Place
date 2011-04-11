# == Schema Information
# Schema version: 20110407160817
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  name               :string(255)
#

#Library for hashing passwords
require 'digest'

class User < ActiveRecord::Base

  #Database relations
  belongs_to :userable, :polymorphic => true

  attr_accessor :password
  attr_accessible :email, :name, :password, :password_confirmation
   
  #Email validations
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :email, :message => "can't be blank"
  validates_format_of :email, :with => EmailRegex, :message => "is invalid"
  validates_uniqueness_of :email, :message => "has been already taken", :case_sensitive => false
  
  #Creates the virtual attribute password_confirmation
  validates_confirmation_of :password, :if => :perform_password_validation?

  #Password validations
  validates_presence_of :password, :if => :perform_password_validation?
  validates_length_of :password, :within => 6..20, :if => :perform_password_validation?
  
  #Name validations
  validates_presence_of :name, :message => "can't be blank"
  validates_length_of :name, :within => 3..20, :message => "must be present"
  
  #update validations
  #validates_confirmation_of :password, :on => :update, :if => :not_validate
  #validates_presence_of :password, :on => :update,:if => :password_changed?
  #validates_length_of :password, :within => 6..40, :on => :update, :if => :password_changed?
  
 
  before_save :encrypt_password
  #before_update :before_update
  
  # Return true if the user's password matches the submitted password.
    def has_password?(submitted_password)
      # Compare encrypted_password with the encrypted version of
      # submitted_password.
      encrypted_password == encrypt(submitted_password)
    end
    
    # Method to authenticate the user , temporary implementation
    def self.authenticate(email, submitted_password)
        user = find_by_email(email)
        return nil  if user.nil?
        return user if user.has_password?(submitted_password)
    end
    
    def remember_me!
        self.remember_token = encrypt("#{salt}--#{id}--#{Time.now.utc}")
        save_without_validation
    end

  private
  
  def encrypt_password
    if self.new_record?
      unless password.nil?
        self.salt = make_salt
        self.encrypted_password = encrypt(password)
      end
    end
  end
  
  def encrypt(string)
    secure_hash("#{salt}#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}#{password}")
  end
  
  def secure_hash(string)
    #string
    Digest::SHA2.hexdigest(string)
  end
  
  protected
  
  def perform_password_validation?
      self.new_record? ? true : !password.blank?
  end
  
  def validate?
    encrypted_password.blank? || !@password.blank?
  end
  
  def password_changed?
    encrypt(password) != self.encrypted_password || password.blank?
  end
  
end
