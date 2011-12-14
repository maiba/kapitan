class Offer::Type::Property < ActiveRecord::Base
  
  set_table_name "offer_properties"

  belongs_to :offer_type, :class_name => "::Offer::type", :foreign_key => "offer_type_id"

  has_many :offer_property_options, :class_name => "::Offer::Type::Property::Option", :foreign_key => "offer_property_id"

  has_many :offer_type_property_discounts, :class_name => "::Offer::Type::Property::Discount", :foreign_key => "offer_property_id"

  accepts_nested_attributes_for :offer_property_options, :allow_destroy => true
  accepts_nested_attributes_for :offer_type_property_discounts, :allow_destroy => true

  validates :title, :presence => true



end
