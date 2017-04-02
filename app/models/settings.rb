class Settings < ApplicationRecord
  belongs_to :portal

  def soft_ttl
    7
  end

  def hard_ttl
    3
  end
end
