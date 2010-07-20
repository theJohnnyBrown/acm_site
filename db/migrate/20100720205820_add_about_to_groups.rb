class AddAboutToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :about, :text
  end

  def self.down
    remove_column :groups, :about
  end
end
