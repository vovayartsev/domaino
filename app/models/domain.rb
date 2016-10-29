class Domain < ApplicationRecord
  belongs_to :portal
  has_many :checks, dependent: :destroy
end
