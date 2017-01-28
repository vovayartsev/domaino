class HerokuService

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
end
