class AddOfferPropertyIdToOfferTypePropertyDiscounts < ActiveRecord::Migration
  def self.up
    add_column :offer_type_property_discounts, :offer_property_id, :integer
  end

  def self.down
    remove_column :offer_type_property_discounts, :offer_property_id
  end
end
