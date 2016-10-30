class RescanJob < ApplicationJob
  queue_as :default

  def perform(check_id)
    check = Check.find(check_id)
    puts "SCANNING: #{check.inspect}"
    sleep rand(3)
    check.update!(status: 'ok')
    PortalChannel.broadcast_to(check.domain.portal, {})
  end
end
