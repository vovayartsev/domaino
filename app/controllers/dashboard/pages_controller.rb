module Dashboard
  class PagesController < BaseController
    def show
      if ENV['PORTAL_ID']
        cookies.signed[:portal_id] = Integer(ENV['PORTAL_ID'])
      end
      @heroku_email = "vovayartsev@gmail.com"
    end
  end
end
