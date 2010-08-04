class Group < ActiveRecord::Base
  has_and_belongs_to_many :people
  has_and_belongs_to_many :events
  belongs_to :contact_person, :class_name => "Person"
end
