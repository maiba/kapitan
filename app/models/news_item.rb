class NewsItem < ActiveRecord::Base

  include HumanUrlHelper

  acts_as_indexed :fields => [:title, :content]

  validates :title, :presence => true, :uniqueness => true

  default_scope order('created_at DESC')

end
