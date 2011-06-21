class CreatePartnersServices < ActiveRecord::Migration
  def self.up
    create_table :partners_services, :id => false, :force => true do |t|
      t.integer :partner_id
      t.integer :service_id
    end
  end

  def self.down
    drop_table :partners_services
  end
end