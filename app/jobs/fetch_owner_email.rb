class FetchOwnerEmail < ApplicationJob
  queue_as :default

  def perform(resource_id)
    portal = Portal.find(resource_id)
    info = HerokuApiService.app_info(resource_id)
    portal.update!(email: info.owner_email)
    SettingsChannel.broadcast_to(portal.settings, {})
  end
end
