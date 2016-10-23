module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_portal

    def connect
      self.current_portal = find_verified_portal
    end

    private

    def find_verified_portal
      Portal.find_by(id: cookies.signed[:portal_id]) or reject_unauthorized_connection
    end
  end
end
