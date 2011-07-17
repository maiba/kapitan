class CreateOffersOfferGroups < ActiveRecord::Migration
  def self.up
    create_table :offers_offer_groups, :force => true, :id => false do |t|
      t.integer :offer_id
      t.integer :offer_group_id
    end
  end

  def self.down
    drop_table :offers_offer_groups
  end
end