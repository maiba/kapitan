class CreateServicePackages < ActiveRecord::Migration

  def self.up
    create_table :service_packages do |t|
      t.float :service_id
      t.string :title
      t.text :content
      t.float :price
      t.integer :position

      t.timestamps
    end

    add_index :service_packages, :id

    load(Rails.root.join('db', 'seeds', 'packages.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "packages"})
    end

    drop_table :service_packages
  end

end
