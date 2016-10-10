module Concerns::HerokuAuth
  # SSO_PARAMS = %i(heroku_id plan callback_url logplex_token region options uuid)

  def validate_token!
    head 403 unless valid_token?
  end

  def ensure_sso_auth!
    head 401 unless sso_authorized?
  end

  def ensure_basic_auth!
    unless basic_auth_valid?
      headers.merge!('WWW-Authenticate' =>  %(Basic realm="Restricted Area"))
      render text: "Not authorized\n", status: 401
    end
  end

  def sso
    cookies[:'heroku-nav-data'] = params['nav-data']
    session[:heroku_sso] = params['nav-data']
    session[:email] = params[:email]
    session[:resource_id] = resource.id

    redirect_to '/dashboard'
  end

  private

  def basic_auth_valid?
    @auth ||= Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials &&
    @auth.credentials == [ENV['HEROKU_USERNAME'], ENV['HEROKU_PASSWORD']]
  end

  def sso_authorized?
    session[:heroku_sso]
  end

  def expected_token
    pre_token = params[:id] + ':' + ENV['SSO_SALT'] + ':' + params[:timestamp]
    Digest::SHA1.hexdigest(pre_token).to_s
  end

  def valid_token?
    (params[:token] == expected_token) && timestamp_fresh?
  end

  def timestamp_fresh?
    params[:timestamp].to_i < (Time.now - 2*60).to_i
  end
end
