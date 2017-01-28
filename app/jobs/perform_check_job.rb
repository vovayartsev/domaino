class PerformCheckJob < ApplicationJob
  queue_as :default

  def perform(check_id)
    Check::Perform.(id: check_id)
  end
end
