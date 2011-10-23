class AddPicToOfferTypes < ActiveRecord::Migration
  def self.up
    add_column :offer_types, :pic_id, :integer
  end

  def self.down
    remove_column :offer_types, :pic_id
  end
end
