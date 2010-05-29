class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.date :when
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

class CreateEventGroupJoinTable < ActiveRecord::Migration 
  def self.up 
    create_table :events_groups, :id => false do |t|          
      t.integer :event_id
      t.integer :group_id  
    end  
  end  

  def self.down 
    drop_table :events_groups  
  end 
end 

class CreateEventPersonJoinTable < ActiveRecord::Migration 
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
