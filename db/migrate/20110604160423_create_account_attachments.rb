class CreateAccountAttachments < ActiveRecord::Migration
  def self.up
    create_table :account_attachments do |t|
      t.integer :account_id
      t.string :resource_file_name
      t.string :resource_content_type
      t.integer :resource_file_size
      t.datetime :resource_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :account_attachments
  end
end
