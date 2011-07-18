class Ad < ActiveRecord::Base

  SIDES = %w(left right)

  acts_as_indexed :fields => [:title, :content]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :photo, :class_name => 'Image'

  scope :side, lambda { |side| where({:side => side} | {:side => ''} | {:side => nil}) }



  validates_inclusion_of :side, :in => %w(left right), :if => 'side.any?'

end
