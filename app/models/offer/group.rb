class Offer::Group < ActiveRecord::Base

  include HumanUrlHelper

  acts_as_indexed :fields => [:title, :content]

  validates :title, :presence => true, :uniqueness => true
  validates_presence_of :photo

  belongs_to :photo, :class_name => '::Image'

  has_and_belongs_to_many :services,
                          :class_name => "::Service",
                          :join_table => "offer_groups_services",
                          :foreign_key => "offer_group_id",
                          :association_foreign_key => "service_id"

  has_and_belongs_to_many :offers,
                          :class_name => "::Offer",
                          :join_table => "offers_offer_groups",
                          :foreign_key => "offer_group_id",
                          :association_foreign_key => "offer_id"

end
