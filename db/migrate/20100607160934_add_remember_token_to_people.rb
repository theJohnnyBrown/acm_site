class AddRememberTokenToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :remember_token, :string
    add_index :people, :remember_token
  end

  def self.down
    remove_column :people, :remember_token
  end
end
