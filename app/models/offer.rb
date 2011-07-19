class Offer < ActiveRecord::Base

  acts_as_indexed :fields => [:title]

  validates :title, :presence => true

  belongs_to :photo, :class_name => '::Image'

  has_many :offer_properties,
           :class_name => "::Offer::Property",
           :foreign_key => 'offer_id'

  has_and_belongs_to_many :offer_groups,
                          :class_name => '::Offer::Group',
                          :join_table => 'offers_offer_groups',
                          :foreign_key => 'offer_id',
                          :association_foreign_key => 'offer_group_id'

  accepts_nested_attributes_for :offer_properties, :allow_destroy => true

end
