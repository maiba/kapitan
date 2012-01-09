class Order < ActiveRecord::Base

  Statuses = %w( new processing finished closed )

  serialize :data

  validates :account, :presence => true
  validates :data, :presence => true
  validates :status, :presence => true, :inclusion => { :in => Statuses }

  before_validation :set_status, :on => :create

  belongs_to :account, :class_name => "::Account", :foreign_key => "account_id"

  def title
    id
  end

private

  def set_status
    self.status = 'new'
  end

end