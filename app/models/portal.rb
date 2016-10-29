class Portal < ApplicationRecord
  has_many :domains, dependent: :destroy
end
