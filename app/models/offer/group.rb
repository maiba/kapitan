class Offer::Group < ActiveRecord::Base

  include HumanUrlHelper

  acts_as_indexed :fields => [:title, :content]

  validates :title, :presence => true, :uniqueness => true
  validates_presence_of :photo

  belongs_to :photo, :class_name => 'Image'

  has_and_belongs_to_many :services, :class_name => 'Service', :join_table => "offer_groups_services", :foreign_key => "offer_group_id"

  has_many :offer_prices, :class_name => 'Offer::Price', :foreign_key => "offer_group_id"
  has_many :offers, :through => :offer_prices

  accepts_nested_attributes_for :offer_prices, :allow_destroy => true, :reject_if => Proc.new {|op| op[:price].empty? || op[:percentage].empty? }

  def all_offer_prices
    (self.offer_prices + not_assigned_offer_prices).compact
  end

  def not_assigned_offer_prices
    Offer.all.map do |offer|
      offer.prices.build(:offer_group_id => self.id) unless self.offers.include?(offer)
    end
  end

end
