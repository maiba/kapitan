class Offer::Price < ActiveRecord::Base

  belongs_to :priceable, :polymorphic => true
  belongs_to :offer, :class_name => '::Offer'

  validate :offer, :presence => true
  validate :price, :presence => true

end
