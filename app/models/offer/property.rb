class Offer::Property < ActiveRecord::Base

  belongs_to :offer, :class_name => "::Offer", :foreign_key => "offer_id"

  has_many :offer_property_options, :class_name => "::Offer::Property::Option", :foreign_key => "offer_property_id"

  accepts_nested_attributes_for :offer_property_options, :allow_destroy => true

  validates :title, :presence => true



end
