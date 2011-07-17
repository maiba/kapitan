class ChangeOfferPrices < ActiveRecord::Migration
  def self.up
    remove_column :offer_prices, :offer_group_id
    remove_column :offer_prices, :percentage
    add_column    :offer_prices, :priceable_id, :integer
    add_column    :offer_prices, :priceable_type, :string
  end

  def self.down
    add_column    :offer_prices, :offer_group_id, :integer
    add_column    :offer_prices, :percentage, :float
    remove_column :offer_prices, :priceable_id
    remove_column :offer_prices, :priceable_type
  end
end