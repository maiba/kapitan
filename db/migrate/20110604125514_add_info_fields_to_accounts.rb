class AddInfoFieldsToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :site, :string
    add_column :accounts, :company, :string
    add_column :accounts, :phone, :string
    add_column :accounts, :activity, :string
  end

  def self.down
    remove_column :accounts, :activity
    remove_column :accounts, :phone
    remove_column :accounts, :company
    remove_column :accounts, :site
  end
end
