class CreatePartners < ActiveRecord::Migration

  def self.up
    create_table :partners do |t|
      t.string :title
      t.integer :photo_id
      t.text :content
      t.integer :position

      t.timestamps
    end

    add_index :partners, :id

    load(Rails.root.join('db', 'seeds', 'partners.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "partners"})

    Page.delete_all({:link_url => "/partners"})

    drop_table :partners
  end

end
