class CreateServices < ActiveRecord::Migration

  def self.up
    create_table :services do |t|
      t.string :title
      t.integer :price_id
      t.integer :photo_id
      t.text :content
      t.integer :position

      t.timestamps
    end

    add_index :services, :id

    load(Rails.root.join('db', 'seeds', 'services.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "services"})

    Page.delete_all({:link_url => "/services"})

    drop_table :services
  end

end
