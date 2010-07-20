require 'digest'
class Person < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation, :group_ids
  

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

  def self.populate!
    grp = Group.new(:name => "Social")
    grp.save
    grp = Group.new(:name => "Professional Development")
    grp.save
    grp = Group.new(:name => "Conferences and Competitions")
    grp.save
    grp = Group.new(:name => "Game Development")
    grp.save
    grp = Group.new(:name => "Robotics")
    grp.save
    grp = Group.new(:name => "ACM Intercollegiate Programing Competition")
    grp.save
    grp = Group.new(:name => "Supercomputing Conference Volunteers")
    grp.save
    
    file = File.new("/home/johnny/Documents/rails/acm_site/app/models/populate.txt", "r")
    while (line = file.gets)
      member = line.split
      last_name = member[0]
      first_name = member[1]
      email = member[2]
      newGuy = Person.new(:name => "#{first_name} #{last_name}", :email => email.downcase, :password => email.downcase, :password_confirmation => email.downcase )
      newGuy.save
      
      if (member[3] == "1")
       newGuy.groups << Group.find(1);
      end
      if (member[4] == "1")
       newGuy.groups << Group.find(2);
      end
      if (member[5] == "1")
       newGuy.groups << Group.find(3);
      end
      if (member[6] == "1")
       newGuy.groups << Group.find(4);
      end 
      if (member[7] == "1")
       newGuy.groups << Group.find(5);
      end
      if (member[8] == "1")
       newGuy.groups << Group.find(6);
      end
      if (member[10] == "1")
       newGuy.groups << Group.find(7);
      end
      newGuy.save
    end
    file.close
  
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
