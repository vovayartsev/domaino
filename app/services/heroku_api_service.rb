class HerokuApiService
  include Singleton
  include Retriable

  class << self
    delegate :get_domains, :app_info, to: :instance
  end

  def app_info(resource_id)
    url = "https://api.heroku.com/vendor/apps/#{resource_id}"

    response = retriable do
      RestClient::Request.execute(
      method: :get,
      url: url,
      user: ENV.fetch('HEROKU_USERNAME'),
      password: ENV.fetch('HEROKU_PASSWORD')
      )
    end

    JSON.parse(response.body, object_class: OpenStruct)
  end

  def get_domains(portal_id)
    if ENV['HEROKU_USERNAME']
      app_info(portal_id).domains
    else
      %w(google.com apple.com dockhero.io)  # dev environment
    end
  end
end
