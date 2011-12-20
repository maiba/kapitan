class Account::Attachment < ActiveRecord::Base

  belongs_to :account, :class_name => "::Account", :foreign_key => "account_id"

  has_attached_file :resource
  before_resource_post_process :transliterate_file_name

  validates :account, :presence => true
  validates_attachment_presence :resource
  validates_attachment_size :resource, :less_than => 2.megabytes
  
  private

  def transliterate_file_name
    extension = File.extname(resource_file_name).gsub(/^\.+/, '')
    filename = resource_file_name.gsub(/\.#{extension}$/, '')
    self.resource.instance_write(:file_name, "#{filename.parameterize}.#{extension.parameterize}")
  end

end