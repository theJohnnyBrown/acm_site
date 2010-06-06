class AddPasswordToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :encrypted_password, :string
  end

  def self.down
    remove_column :people, :encrypted_password
  end
end
