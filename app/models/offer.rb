class Offer < ActiveRecord::Base

  acts_as_indexed :fields => [:title]

  belongs_to :photo, :class_name => '::Image'

  has_many :offer_types,
           :class_name => "::Offer::Type",
           :foreign_key => 'offer_id'

  has_and_belongs_to_many :offer_groups,
                          :class_name => '::Offer::Group',
                          :join_table => 'offers_offer_groups',
                          :foreign_key => 'offer_id',
                          :association_foreign_key => 'offer_group_id'

  accepts_nested_attributes_for :offer_types, :allow_destroy => true

  validates :title, :presence => true
  validates :suffix, :presence => true
  validates :quantity, :presence => true

end
