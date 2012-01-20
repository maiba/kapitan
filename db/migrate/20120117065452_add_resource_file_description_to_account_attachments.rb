class AddResourceFileDescriptionToAccountAttachments < ActiveRecord::Migration
  def self.up
    add_column :account_attachments, :resource_file_description, :text
  end

  def self.down
    remove_column :account_attachments, :resource_file_description
  end
end
