class Property::List < Property

  has_many :options, :class_name => "::Property::List::Option", :foreign_key => "property_list_id"

end
