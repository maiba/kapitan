class AddSomeFieldsToOffers < ActiveRecord::Migration
  def self.up
    add_column :offers, :quantity, :integer
    add_column :offers, :suffix, :string
  end

  def self.down
    remove_column :offers, :suffix
    remove_column :offers, :quantity
  end
end
