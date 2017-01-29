class DomainsListChannel < ApplicationCable::Channel
  def subscribed
    redux_stream_for(current_portal) do
      Portal::ListDomains::JSON.(id: current_portal.id)
    end
  end
end
