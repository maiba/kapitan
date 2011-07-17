class Account::Attachment < ActiveRecord::Base

  belongs_to :account, :class_name => "::Account", :foreign_key => "account_id"

  has_attached_file :resource

  validates :account, :presence => true
  validates_attachment_presence :resource
  validates_attachment_size :resource, :less_than => 2.megabytes

end