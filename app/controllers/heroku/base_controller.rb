module Heroku
  class BaseController < ::ApplicationController
    wrap_parameters format: :json

  end
end
