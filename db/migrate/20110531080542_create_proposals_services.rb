class CreateProposalsServices < ActiveRecord::Migration
  def self.up
    create_table :proposals_services, :id => false, :force => true do |t|
      t.integer :proposal_id
      t.integer :service_id
    end
  end

  def self.down
    drop_table :proposals_services
  end
end
