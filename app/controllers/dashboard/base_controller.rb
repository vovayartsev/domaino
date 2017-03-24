module Dashboard
  class BaseController < ::ApplicationController
    before_action { cookies.signed[:portal_id] = Integer(ENV['PORTAL_ID']) if ENV['PORTAL_ID'] }
    
    include Trailblazer::Operation::Controller

    protected

    def current_portal
      @current_portal ||= Portal.find_by(id: cookies.signed[:portal_id])
    end
  end
end
