class EventsPeople < ActiveRecord::Migration
  def self.up
    create_table :events_people, :id => false do |t|  
     t.integer :event_id  
     t.integer :person_id 
    end
  end

  def self.down
    drop_table :events_people
  end
end
