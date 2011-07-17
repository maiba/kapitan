class CreatePropertyListOptions < ActiveRecord::Migration
  def self.up
    create_table :property_list_options do |t|
      t.string :name
      t.integer :property_list_id
      t.timestamps
    end
  end

  def self.down
    drop_table :property_list_options
  end
end
