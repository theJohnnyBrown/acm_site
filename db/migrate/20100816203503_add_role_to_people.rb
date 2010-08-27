class AddRoleToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :role, :integer
  end

  def self.down
    remove_column :people, :role
  end
end
