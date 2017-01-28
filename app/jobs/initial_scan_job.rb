class InitialScanJob < ApplicationJob
  queue_as :default

  def perform(portal_id)
    Portal::StartScan.(id: portal_id)
  end
end
