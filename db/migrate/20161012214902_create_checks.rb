class CreateChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :checks do |t|
      t.integer :domain_id, index: true, null: false
      t.integer :kind, null: false
      t.datetime :last_scan_requested_at
      t.datetime :last_scan_at
      t.integer :status, null: false, default: 0
      t.date :expiration

      t.timestamps
    end
  end
end
