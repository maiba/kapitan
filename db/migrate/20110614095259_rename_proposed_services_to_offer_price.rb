class RenameProposedServicesToOfferPrice < ActiveRecord::Migration
  def self.up
    rename_table :proposed_services, :offer_prices
  end

  def self.down
    rename_table :offer_prices, :proposed_services
  end
end