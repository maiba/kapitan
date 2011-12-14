class CreateOfferTypePropertyDiscounts < ActiveRecord::Migration
  def self.up
    create_table :offer_type_property_discounts do |t|
      t.integer :limit
      t.integer :percent

      t.timestamps
    end
  end

  def self.down
    drop_table :offer_type_property_discounts
  end
end
