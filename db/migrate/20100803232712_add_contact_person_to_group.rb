class AddContactPersonToGroup < ActiveRecord::Migration
  def self.up
    add_column :groups, :contact_person_id, :integer
  end

  def self.down
    remove_column :people, :contact_person_id
  end
end
