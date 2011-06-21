class Service < ActiveRecord::Base

  include HumanUrlHelper

  acts_as_indexed :fields => [:title, :content]

  acts_as_nested_set

  validates :title, :presence => true, :uniqueness => true

  belongs_to :photo, :class_name => 'Image'
  belongs_to :price, :class_name => 'Resource'

  has_and_belongs_to_many :offer_groups,
                          :class_name => 'Offer::Group',
                          :join_table => "offer_groups_services",
                          :foreign_key => "service_id",
                          :association_foreign_key => "offer_group_id"

end
