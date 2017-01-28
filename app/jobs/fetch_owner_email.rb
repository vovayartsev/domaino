class FetchOwnerEmail < ApplicationJob
  queue_as :default
  include Retriable

  def perform(resource_id)
    portal = Portal.find(resource_id)
    info = HerokuService.new.app_info(resource_id)
    portal.update!(email: info.email)
    SettingsChannel.broadcast_to(portal.settings, {})
  end
end
