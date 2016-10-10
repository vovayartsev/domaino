module Heroku
  class SsoController < BaseController
    include Concerns::HerokuAuth

    # /heroku/sso_login
    def login
      sso
    end
  end

end
