class RenameProposalsToOffers < ActiveRecord::Migration
  def self.up
    rename_table :proposals, :offers
  end

  def self.down
    rename_table :offers, :proposals
  end
end