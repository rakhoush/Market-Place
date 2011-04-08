class AddPolymorphicToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :userable_id, :integer
    add_column :users, :userable_type, :string
  end

  def self.down
    remove_column :users, :userable_id, :integer
    remove_column :users, :userable_type, :string
  end
end
