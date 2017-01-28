module Dashboard
  class PagesController < BaseController
    before_action { cookies.signed[:portal_id] = Integer(ENV['PORTAL_ID']) if ENV['PORTAL_ID'] }

    def show
      @heroku_email = "vovayartsev@gmail.com"
    end
  end
end
