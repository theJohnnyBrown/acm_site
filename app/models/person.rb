require 'digest'
class Person < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :events
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_confirmation_of :password
  validates_presence_of :name, :email, :password
  validates_format_of :email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false
  validates_length_of :password, :within => 6..40
  
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def remember_me!
    self.remember_token = encrypt("#{salt}--#{id}#{Time.now.utc}")
    save_without_validation
  end
  
  def self.authenticate(email, submitted_password)
    person = find_by_email(email)
    return nil  if person.nil?
    return person if person.has_password?(submitted_password)
  end

  private

    def encrypt_password
      unless password.nil?
        self.salt = secure_hash("#{Time.now.utc}#{password}")
        self.encrypted_password = encrypt(password)
      end
    end

    def encrypt(string)
      secure_hash("#{salt}#{string}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
