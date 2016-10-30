module Dashboard
  class ScansController < BaseController
    def create
      Portal::StartScan.(id: current_portal.id)
      head 204
    end
  end
end
