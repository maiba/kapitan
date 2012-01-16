class ChangePercentInOfferTypePropertyDiscounts < ActiveRecord::Migration
  def self.up
    change_column :offer_type_property_discounts, :percent, :float
  end

  def self.down
    change_column :offer_type_property_discounts, :percent, :integer
  end
end