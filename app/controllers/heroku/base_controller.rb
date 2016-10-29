module Heroku
  class BaseController < ::ApplicationController
    wrap_parameters format: :json

    private

    def current_portal_id
      cookies.signed[:portal_id]
    end
  end
end
