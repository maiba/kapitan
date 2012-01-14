class AddServicesSeoMeta < ActiveRecord::Migration
  def self.up
   add_column :services, :browser_title, :string
   add_column :services, :meta_keywords, :string
   add_column :services, :meta_description, :text
  end

  def self.down
    remove_column :services, :browser_title, :string
    remove_column :services, :meta_keywords, :string
    remove_column :services, :meta_description, :text
  end
end
