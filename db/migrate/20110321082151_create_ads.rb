class CreateAds < ActiveRecord::Migration

  def self.up
    create_table :ads do |t|
      t.string :title
      t.datetime :date
      t.integer :photo_id
      t.text :content
      t.integer :position

      t.timestamps
    end

    add_index :ads, :id

    load(Rails.root.join('db', 'seeds', 'ads.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "ads"})

    Page.delete_all({:link_url => "/ads"})

    drop_table :ads
  end

end
