class AddNestedSetToServices < ActiveRecord::Migration
  def self.up
    add_column :services, :parent_id, :integer
    add_column :services, :lft, :integer
    add_column :services, :rgt, :integer
  end

  def self.down
    remove_column :services, :rgt
    remove_column :services, :lft
    remove_column :services, :parent_id
  end
end
