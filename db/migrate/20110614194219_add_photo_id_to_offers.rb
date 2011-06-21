class AddPhotoIdToOffers < ActiveRecord::Migration
  def self.up
    add_column :offers, :photo_id, :integer
  end

  def self.down
    remove_column :offers, :photo_id
  end
end
