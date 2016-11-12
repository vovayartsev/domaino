class SettingsChannel < ApplicationCable::Channel
  def subscribed
    redux_stream_for(current_portal.settings) do
      Settings::Show::JSON.(portal_id: current_portal.id)
    end
  end
end
