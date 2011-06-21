class AddLinkAndSideToAds < ActiveRecord::Migration
  def self.up
    add_column :ads, :link, :string
    add_column :ads, :side, :string
  end

  def self.down
    remove_column :ads, :side
    remove_column :ads, :link
  end
end
