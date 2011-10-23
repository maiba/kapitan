class AddDescriptionToOfferTypes < ActiveRecord::Migration
  def self.up
    add_column :offer_types, :description, :text
  end

  def self.down
    remove_column :offer_types, :description
  end
end
