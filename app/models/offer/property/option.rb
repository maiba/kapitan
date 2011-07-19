class Offer::Property::Option < ActiveRecord::Base

  set_table_name "offer_property_options"

  belongs_to :offer_property,
             :class_name => "::Offer::Property",
             :foreign_key => "offer_property_id"

  validates :title, :presence => true
  validates :price, :presence => true


end
