class AddArticlesSeoMeta < ActiveRecord::Migration
  def self.up
   add_column :articles, :browser_title, :string
   add_column :articles, :meta_keywords, :string
   add_column :articles, :meta_description, :text
  end

  def self.down
    remove_column :articles, :browser_title, :string
    remove_column :articles, :meta_keywords, :string
    remove_column :articles, :meta_description, :text
  end
end
