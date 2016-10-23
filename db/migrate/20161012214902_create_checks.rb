class CreateChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :checks do |t|
      t.integer :domain_id, index: true, null: false
      t.integer :kind
      t.datetime :last_scan_requested_at
      t.datetime :last_scan_at
      t.integer :status

      t.timestamps
    end
  end
end
