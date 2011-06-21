class ModifyPagesShowMenu < ActiveRecord::Migration
  def self.up
    add_column :pages, :show_in_left_menu, :boolean
  end

  def self.down
    remove_column :pages, :show_in_left_menu
  end
end