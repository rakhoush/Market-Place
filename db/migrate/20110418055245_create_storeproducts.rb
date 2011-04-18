class CreateStoreproducts < ActiveRecord::Migration
  def self.up
    create_table :storeproducts do |t|
      t.integer :product_id
      t.integer :store_id
      t.decimal :price, :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :storeproducts
  end
end
