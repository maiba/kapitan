class Offer::Price < ActiveRecord::Base

  belongs_to :offer, :class_name => 'Offer'
  belongs_to :offer_group, :class_name => 'Offer::Group'

  validate :offer, :presence => true
  validate :offer_group, :presence => true
  validate :price, :presence => true
  validate :percentage, :presence => true

  def sum_price
    price + (percentage.to_f / 100 * price)
  end

end
