class PortalChannel < ApplicationCable::Channel
  def subscribed
    transmit redux_action
    stream_for(current_portal) {transmit redux_action}
  end

  private

  def redux_action
    Portal::Show.(id: current_portal.id)
  end
end
