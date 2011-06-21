class AddShowInFooterToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :show_in_footer, :boolean
  end

  def self.down
    remove_column :pages, :show_in_footer
  end
end
