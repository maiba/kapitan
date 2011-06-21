class Article < ActiveRecord::Base

  include HumanUrlHelper

  acts_as_indexed :fields => [:title, :content]

  validates :title, :presence => true, :uniqueness => true

end
