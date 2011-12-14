class Offer::Type::Property::Discount < ActiveRecord::Base

  set_table_name "offer_type_property_discounts"

  validates :limit, :presence => true
  validates :percent, :presence => true, :numericality => { :less_then => 100 }

  belongs_to :offer_property,
             :class_name => "::Offer::Type::Property",
             :foreign_key => "offer_property_id"
end
