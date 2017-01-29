module Dashboard
  class ScansController < BaseController
    def create
      Portal::StartScan.(id: current_portal.id)
      head 204
    rescue
      rb = Rollbar.error($!)
      render json: { error: $!.message, trace: $!.backtrace.grep(/app/)[0..3], rollbar: rb }, status: 422
    end
  end
end
