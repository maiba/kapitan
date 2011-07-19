class CreateOfferPropertyOptions < ActiveRecord::Migration
  def self.up
    create_table :offer_property_options, :force => true do |t|
      t.integer :offer_property_id
      t.string :title
      t.float :price
      t.timestamps
    end
  end

  def self.down
    drop_table :offer_property_options
  end
end