class ChangeOffers < ActiveRecord::Migration
  def self.up
    remove_column :offers, :suffix
  end

  def self.down
    add_column :offers, :suffix, :string
  end
end