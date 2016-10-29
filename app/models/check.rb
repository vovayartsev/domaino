class Check < ApplicationRecord
  belongs_to :domain
  enum kind: [ :ssl, :dns ]
  enum status: [ :scanning, :expired, :warning, :ok, :na ]
end

# t.integer  "domain_id",              null: false
# t.integer  "kind"
# t.datetime "last_scan_requested_at"
# t.datetime "last_scan_at"
# t.integer  "status"
# t.date     "expiration"
