class Check < ApplicationRecord
  belongs_to :domain
  enum kind: [ :ssl, :dns ]
  enum status: [ :scanning, :expired, :warning, :ok, :na ]
end
