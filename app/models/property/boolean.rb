class Property::Boolean < Property

  has_many :prices, :class_name => "::Offer::Price", :as => :priceable
  has_many :offers, :through => :prices

end
