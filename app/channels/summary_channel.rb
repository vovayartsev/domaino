class SummaryChannel < ApplicationCable::Channel
  def subscribed
    redux_stream_for(current_portal) do
      Summary::Show::JSON.(portal_id: current_portal.id)
    end
  end
end
