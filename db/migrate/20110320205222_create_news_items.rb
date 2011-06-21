class CreateNewsItems < ActiveRecord::Migration

  def self.up
    create_table :news_items do |t|
      t.string :title
      t.datetime :date
      t.text :content
      t.integer :position

      t.timestamps
    end

    add_index :news_items, :id

    load(Rails.root.join('db', 'seeds', 'news_items.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "news_items"})

    Page.delete_all({:link_url => "/news_items"})

    drop_table :news_items
  end

end
