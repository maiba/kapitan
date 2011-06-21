class RenamePartnersToOfferGroup < ActiveRecord::Migration
  def self.up
    rename_table :partners, :offer_groups
  end

  def self.down
    rename_table :offer_groups, :partners
  end
end