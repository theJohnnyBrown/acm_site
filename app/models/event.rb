class Event < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :people
end
