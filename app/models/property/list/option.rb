class Property::List::Option < ActiveRecord::Base

  belongs_to :list, :class_name => "::Property::List", :foreign_key => "property_list_id"
  has_many :prices, :class_name => "::Offer::Price", :as => :priceable
  has_many :offers, :through => :prices

end
