class DestroyOfferPrices < ActiveRecord::Migration
  def self.up
    drop_table :offer_prices
  end

  def self.down
    create_table "offer_prices", :force => true do |t|
      t.integer  "offer_id"
      t.float    "price"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "priceable_id"
      t.string   "priceable_type"
    end
  end
end
