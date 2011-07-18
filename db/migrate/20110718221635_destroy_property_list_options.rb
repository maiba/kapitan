class DestroyPropertyListOptions < ActiveRecord::Migration
  def self.up
    drop_table :property_list_options
  end

  def self.down
    create_table "property_list_options", :force => true do |t|
      t.string   "name"
      t.integer  "property_list_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
