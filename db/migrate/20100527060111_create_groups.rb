class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end

class CreatePersonGroupJoinTable < ActiveRecord::Migration 
  def self.up 
    create_table :people_groups, :id => false do |t|          
      t.integer :person_id
      t.integer :group_id  
    end  
  end  

  def self.down 
    drop_table :people_groups  
  end 
end 
