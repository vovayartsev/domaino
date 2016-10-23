module Dashboard
  class PortalsController < BaseController
    respond_to :json

    def show
      # binding.pry
      respond Portal::Show, params: {id: cookies.signed[:portal_id]}
      #
      # portal = Portal.first
      #
      # headers['Content-Type'] = 'text/event-stream'
      # headers['Cache-Control'] = 'no-cache'
      # headers['Connection'] = 'keep-alive'
      #
      # headers['rack.hijack'] = proc do |io|
      #   Rails.application.pubsub.sse_stream(portal, io, Portal::Show, id: Portal.first.id)
      # end
      #
      # render nothing: true
    end
  end
end
