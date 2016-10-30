module Dashboard
  class BaseController < ::ApplicationController
    include Trailblazer::Operation::Controller

    protected

    def current_portal
      @current_portal ||= Portal.find_by(id: cookies.signed[:portal_id])
    end
  end
end
