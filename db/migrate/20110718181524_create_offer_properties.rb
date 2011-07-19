class CreateOfferProperties < ActiveRecord::Migration
  def self.up
    create_table :offer_properties do |t|
      t.string :title
      t.integer :offer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :offer_properties
  end
end
