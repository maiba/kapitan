class Offer::Type < ActiveRecord::Base
  
  belongs_to :offer, :class_name => "::Offer", :foreign_key => "offer_id"

  has_many :offer_properties, :class_name => "::Offer::Type::Property", :foreign_key => "offer_type_id"

  accepts_nested_attributes_for :offer_properties, :allow_destroy => true

  validates :title, :presence => true
end
