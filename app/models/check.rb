class Check < ApplicationRecord
  belongs_to :domain
  enum kind: [ :ssl, :dns ]
  enum status: [ :scanning, :expired, :warning, :ok, :na ]

  scope :active_alerts, -> { where(status: 'warning', acknowledged: false) }
end
