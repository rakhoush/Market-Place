class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string :zip
      t.string :street
      t.string :number
      t.string :district
      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
