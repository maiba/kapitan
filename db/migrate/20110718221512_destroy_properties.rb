class DestroyProperties < ActiveRecord::Migration
  def self.up
    drop_table :properties
  end

  def self.down
    create_table "properties", :force => true do |t|
      t.string   "name"
      t.string   "type"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
