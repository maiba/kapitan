class CreateArticles < ActiveRecord::Migration

  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :position

      t.timestamps
    end

    add_index :articles, :id

    load(Rails.root.join('db', 'seeds', 'articles.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "articles"})

    Page.delete_all({:link_url => "/articles"})

    drop_table :articles
  end

end
