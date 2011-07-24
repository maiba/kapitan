class Service::Package < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :content]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :service, :class_name => "::Service", :foreign_key => "service_id"

end
