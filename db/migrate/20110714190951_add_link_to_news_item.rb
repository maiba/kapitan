class AddLinkToNewsItem < ActiveRecord::Migration
  def self.up
    add_column :news_items, :link, :string
  end

  def self.down
    remove_column :news_items, :link, :string
  end
end
