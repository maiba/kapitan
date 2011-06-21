class CreateProposedServices < ActiveRecord::Migration
  def self.up
    create_table :proposed_services do |t|
      t.integer :partner_id
      t.integer :proposal_id
      t.float :price
      t.integer :percentage

      t.timestamps
    end
  end

  def self.down
    drop_table :proposed_services
  end
end
