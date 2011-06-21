class Offer < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :suffix]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :photo, :class_name => 'Image'
  has_many :prices, :class_name => 'Offer::Price', :foreign_key => "offer_id"
  has_many :offer_groups, :through => :prices

  # accepts_nested_attributes_for :prices, :allow_destroy => true, :reject_if => :all_blank

end
