class Offer < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :suffix]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :photo, :class_name => 'Image'

  has_many :prices, :class_name => '::Offer::Price', :foreign_key => "offer_id"
  has_many :offer_groups, :through => :prices

  has_and_belongs_to_many :groups,
                          :class_name => "::Offer::Group",
                          :join_table => "offers_offer_groups",
                          :foreign_key => "offer_id",
                          :association_foreign_key => "offer_group_id"


end
