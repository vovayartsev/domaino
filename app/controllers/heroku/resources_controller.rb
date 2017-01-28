module Heroku
  class ResourcesController < BaseController
    include Concerns::HerokuAuth
    before_action :ensure_basic_auth!

    respond_to :json

    def show
      sso
    end

    def create
      resource = Portal.create!(resource_params.to_h)
      resource.create_settings!

      FetchOwnerEmail.set(wait: 5.seconds).perform_later(resource.id)
      RescanJob.set(wait: 10.seconds).perform_later(resource.id)

      render json: {
        :id => resource.id,
        :config => {},
        :message => 'Successfully installed'
      }
    end

    def update
      resource = Portal.find(params[:id])
      resource.update!(resource_params.to_h)
      head 200
    end

    def destroy
      resource = Portal.find(params[:id])
      resource.destroy
      head 200
    end

    private

    def resource_params
      params.
        require(:resource).
        permit(:heroku_id, :uuid, :plan, :callback_url, :logplex_token, :region, :options).
        slice('heroku_id', 'uuid', 'plan')
    end
  end
end
