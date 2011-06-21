class RenamePartnersServicesToOfferGroupsServices < ActiveRecord::Migration
  def self.up
    rename_table :partners_services, :offer_groups_services
  end

  def self.down
    rename_table :offer_groups_services, :partners_services
  end
end