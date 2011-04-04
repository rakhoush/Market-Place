# == Schema Information
# Schema version: <timestamp>
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  encrypted_password :string(255)
#  salt :string(255)
#  created_at :datetime
#  updated_at :datetime
#

#Library for hashing passwords
require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :password, :password_confirmation
  
  #Email validations
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :email, :message => "can't be blank"
  validates_format_of :email, :with => EmailRegex, :message => "is invalid"
  validates_uniqueness_of :email, :message => "has been already taken", :case_sensitive => false
  
  #Creates the virtual attribute password_confirmation
  validates_confirmation_of :password, :message => "should match confirmation"
  
  #Password validations
  validates_presence_of :password, :message => "can't be blank"
  validates_length_of :password, :within => 6..40, :message => "must be between 6 and 40 characters"
  
  before_save :encrypt_password
  
  # Return true if the user's password matches the submitted password.
    def has_password?(submitted_password)
      # Compare encrypted_password with the encrypted version of
      # submitted_password.
      encrypted_password == encrypt(submitted_password)
    end
  
  private
  
  def encrypt_password
    self.salt = make_salt
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(string)
    secure_hash("#{salt}#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
  
end
