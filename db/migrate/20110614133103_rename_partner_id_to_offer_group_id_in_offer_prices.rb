class RenamePartnerIdToOfferGroupIdInOfferPrices < ActiveRecord::Migration
  def self.up
    rename_column :offer_prices, :partner_id, :offer_group_id
    rename_column :offer_prices, :proposal_id, :offer_id
  end

  def self.down
    rename_column :offer_prices, :offer_id, :proposal_id
    rename_column :offer_prices, :offer_group_id, :partner_id
  end
end