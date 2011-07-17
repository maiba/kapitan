class DestroyProposalsServices < ActiveRecord::Migration
  def self.up
    drop_table :proposals_services
  end

  def self.down
    create_table :proposals_services, :id => false, :force => true do |t|
      t.integer :proposal_id
      t.integer :service_id
    end
  end
end
