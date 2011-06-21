class RenamePartnerIdToOfferGroupIdInOfferGroupsServices < ActiveRecord::Migration
  def self.up
    rename_column :offer_groups_services, :partner_id, :offer_group_id
  end

  def self.down
    rename_column :offer_groups_services, :offer_group_id, :partner_id
  end
end